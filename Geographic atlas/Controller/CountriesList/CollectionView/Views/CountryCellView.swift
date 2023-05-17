//
//  CountryCellView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit



final class CountryCellView: UICollectionViewCell {
    //MARK: - Initialization
    static let id = "CountryCellView"
    
    let cellView = CountryCollectionCellView()
    let detailView = CustomCollectionCountyDetailView()
    
    var isDetailViewHidden: Bool {
        detailView.isHidden
    }
    
    override var isSelected: Bool {
        didSet {
            if isDetailViewHidden, isSelected {
                showDetailView()
                cellView.setUpArrowImage()
            } else {
                hideDetailView()
                cellView.setDownArrowImage()
            }
        }
    }
    
    override func prepareForReuse() {
        if isDetailViewHidden, isSelected {
            
            showDetailView()
            cellView.setUpArrowImage()
        } else if !isDetailViewHidden, isSelected {
            hideDetailView()
            cellView.setDownArrowImage()
        }
        else {
            hideDetailView()
            cellView.setDownArrowImage()
        }

    }

    
    override func updateConstraints() {
        
            super.updateConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    //MARK: - Configuring methods
    func configure(with model: Country) {
        cellView.configure(withName: model.name.common, andCapital: model.capital?.first ?? "No capital", andImageURL: URL(string: model.flags.png) ?? URL(string: Links.flagPlaceholer.rawValue)!)
//        force unwrapping to existing picture
        detailView.configure(withPopulation: String.convertIntWithPrefix(model.population), andArea: String.convertDoubleWithPrefix(model.area), andCurrencies: model.currencies)
    }
}
    //MARK: - BaseView methods
private
extension CountryCellView {
    func setupViews() {
        
        [
        cellView,
        detailView
        ].forEach { contentView.addSubview($0) }
    }
    
    func constraintViews() {
        
        cellView.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading)
            $0.top.equalTo(contentView.snp.top)
            $0.trailing.equalTo(contentView.snp.trailing)
        }
        
        detailView.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading)
            $0.top.equalTo(cellView.snp.bottom)
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        contentView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureAppearance() {
        backgroundColor = R.Colors.contentBackground
        self.roundCorners(with: 12, and: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
        detailView.isHidden = true
    }
}

extension CountryCellView {
    func showDetailView() {
        detailView.isHidden = false
    }
    
    func hideDetailView() {
        detailView.isHidden = true

    }
    
    func buttonAction(target: Any, action: Selector) {
        detailView.addButtonTarget(target: target, action: action)
    }

}
