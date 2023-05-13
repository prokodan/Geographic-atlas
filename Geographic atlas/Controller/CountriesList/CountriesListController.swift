//
//  CountriesListController.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

struct MockData {
    let continent: String
    let countries: [Countries]
    
    struct Countries {
        let name: String
        let capital: String
        let image: UIImage
        let population: String
        let area: String
        let currencies: [String]
    }
}

class CountriesListController: GABaseController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    private var dataSource: [MockData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.NavBar.countriesListTitle
        navigationController?.navigationBar.addBottomBorder(withColor: R.Colors.separatorColor, andHeight: 1)
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
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    private func  mockDataSource() {
        dataSource = [
            .init(continent: "Europe", countries: [
                .init(name: "Germany", capital: "Berlin", image: R.Pictures.Cell.flagPicture!, population: "2.45 mln", area: "4.444 km2", currencies: ["eur"]),
                .init(name: "Austria", capital: "Vienna", image: R.Pictures.Cell.flagPicture!, population: "1.44 mln", area: "2.12 km2", currencies: ["eur"])
            ]),
            .init(continent: "Australia", countries: [
                .init(name: "Australia", capital: "Canberra", image: R.Pictures.Cell.flagPicture!, population: "5.23 mln", area: "10.1 km2", currencies: ["ausd"])
            ]),
            .init(continent: "Asia", countries: [
                .init(name: "Kazakhstan", capital: "Astana", image: R.Pictures.Cell.flagPicture!, population: "17 mln", area: "9.9 km2", currencies: ["kzt"])
            ])
        ]
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        mockDataSource()
        collectionView.register(CountryCellView.self, forCellWithReuseIdentifier: CountryCellView.id)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.id)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
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
        UIView.animate(withDuration: 0.3) {
            self.collectionView.performBatchUpdates(nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = self.collectionView.cellForItem(at: indexPath) as? CountryCellView {
            cell.hideDetailView()
        }
    }
    
}
//MARK: - UICollectionViewDataSource
extension CountriesListController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCellView.id, for: indexPath) as? CountryCellView else { return UICollectionViewCell() }
//        let item = dataSource[indexPath.section].countries[indexPath.row]
        cell.configure(with: dataSource[indexPath.section].countries[indexPath.row])
        return cell
                
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }
        let item = dataSource[indexPath.section].continent
        view.configure(with: item)
        return view
    }
    

}
