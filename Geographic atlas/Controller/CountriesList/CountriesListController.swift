//
//  CountriesListController.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit
import SnapKit

class CountriesListController: GABaseController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.selfSizingInvalidation = .enabled
        return view
    }()
    
    private var model: [Country] = []
    private var sectionedModels: [[Continent] : [Country]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

extension CountriesListController {

    override func setupViews() {
        super.setupViews()
        [
        collectionView
        ].forEach {view.addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalToSuperview().offset(-12)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func updateModel() {
        DispatchQueue.main.async {
            NetworkManager.shared.fetchRequest(Links.allcountries.rawValue) { result in
                switch result {
                case .success(let model):
                    self.model = model
                    self.sectionedModels = Dictionary(grouping: model, by: {$0.continents})
                    self.collectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = R.Strings.NavBar.countriesListTitle
        navigationController?.navigationBar.addBottomBorder(withColor: R.Colors.separatorColor, andHeight: 1)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", image: nil, primaryAction: nil, menu: nil)
        
        updateModel()
        collectionView.register(CountryCellView.self, forCellWithReuseIdentifier: CountryCellView.id)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.id)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        collectionView.reloadData()
        collectionView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension CountriesListController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var heightConstant: Double = 72
        if let cell = self.collectionView.cellForItem(at: indexPath) as? CountryCellView {
            heightConstant = cell.isDetailViewHidden ? 72 : 216
        }
        return CGSize(width: collectionView.frame.width, height: heightConstant)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCellView.id, for: indexPath) as? CountryCellView
        UIView.animate(withDuration: 0.3) {
            self.collectionView.performBatchUpdates(nil)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = self.collectionView.cellForItem(at: indexPath) as? CountryCellView {
            cell.hideDetailView()
        }
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCellView.id, for: indexPath) as? CountryCellView
//        cell?.hideDetailView()
            

    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCellView.id, for: indexPath) as? CountryCellView else { return }
        cell.layoutIfNeeded()
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCellView.id, for: indexPath) as? CountryCellView else { return }
        cell.hideDetailView()
        cell.layoutIfNeeded()
    }
    
    
    
}
//MARK: - UICollectionViewDataSource
extension CountriesListController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sectionedModels.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionKey = Array(sectionedModels.keys)[section]
        return sectionedModels[sectionKey]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCellView.id, for: indexPath) as? CountryCellView else { return UICollectionViewCell() }
        let sectionKey = Array(sectionedModels.keys)[indexPath.section]
        let cellModel = sectionedModels[sectionKey]![indexPath.item]
        cell.configure(with: cellModel)
        cell.buttonAction(target: self, action: #selector(didTapButton))
        return cell
                
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }
        let sectionKey = Array(sectionedModels.keys)[indexPath.section]
        view.configure(with: sectionKey.first?.rawValue ?? "Header defaul name")
        return view
    }
}

@objc
extension CountriesListController {
    func didTapButton() {
        let countryDetailsVC = CountryDetails()
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        let sectionKey = Array(sectionedModels.keys)[indexPath.section]
        let model = sectionedModels[sectionKey]![indexPath.item]
        NetworkManager.shared.fetchRequest(Links.countryCCA2.rawValue, andCCA2Code: model.cca2) { result in
            switch result {
            case .success(let countryModel):
                countryDetailsVC.dataModel = countryModel.first
                print(countryModel)
                self.navigationController?.pushViewController(countryDetailsVC, animated: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
