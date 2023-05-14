//
//  CountryCellView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit



final class CountryCellView: UICollectionViewCell {

    static let id = "CountryCellView"
    
    private let containerView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    private let cellView = CountryCollectionCellView()
    private let detailView = CustomCollectionCountyDetailView()
    
    var isDetailViewHidden: Bool {
        detailView.isHidden
    }
    
    override var isSelected: Bool {
        didSet {
            if isDetailViewHidden, isSelected {
                cellView.setUpArrowImage()
                showDetailView()
            } else {
                cellView.setDownArrowImage()
                hideDetailView()
            }
        }
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
    
    func configure(with cellData: MockData.Countries) {
        cellView.configure(with: cellData.name, andSubtitle: cellData.capital, andFlagImage: cellData.image)
        detailView.configure(withPopulation: cellData.population, andArea: cellData.area, andCurrencies: cellData.currencies)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        var newFrame = layoutAttributes.frame
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}



private
extension CountryCellView {
    func setupViews() {
        
        [
        cellView,
        detailView
        ].forEach { containerView.addArrangedSubview($0) }
        
        contentView.addView(containerView)
        
        [
        cellView,
        detailView,
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
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

