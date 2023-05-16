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
    
//    private let containerView : UIStackView = {
//        let view = UIStackView()
//        view.axis = .vertical
//        return view
//    }()
    private let cellView = CountryCollectionCellView()
    private let detailView = CustomCollectionCountyDetailView()
    
    var isDetailViewHidden: Bool {
        detailView.isHidden
    }
    
    override func updateConstraints() {
        
            super.updateConstraints()
    }
    
    override var isSelected: Bool {
        didSet {
            if isDetailViewHidden, isSelected {
                cellView.setUpArrowImage()
//                containerView.addArrangedSubview(detailView)
//                containerView.translatesAutoresizingMaskIntoConstraints = false
                
                showDetailView()
//            } else if isDetailViewHidden, !isSelected {
//                cellView.setDownArrowImage()
//                hideDetailView()
//                detailView.removeFromSuperview()
            } else {
                cellView.setDownArrowImage()
                hideDetailView()
//                detailView.removeFromSuperview()
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
    
//    override func prepareForReuse() {
//        if isDetailViewHidden, isSelected {
//            cellView.setUpArrowImage()
//            showDetailView()
//        } else {
//            cellView.setDownArrowImage()
//            hideDetailView()
//        }
//    }
    
    //MARK: - Configuring methods
    func configure(with model: Country) {
        cellView.configure(withName: model.name.common, andCapital: model.capital?.first ?? "No capital", andImageURL: URL(string: model.flags.png) ?? URL(string: Links.flagPlaceholer.rawValue)!)
//        force unwrapping to existing picture
        detailView.configure(withPopulation: String.convertIntWithPrefix(model.population), andArea: String.convertDoubleWithPrefix(model.area), andCurrencies: model.currencies)
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
//        var newFrame = layoutAttributes.frame
//        newFrame.size.height = ceil(size.height)
//        layoutAttributes.frame = newFrame
//        return layoutAttributes
//    }
}
    //MARK: - BaseView methods
private
extension CountryCellView {
    func setupViews() {
        
        [
        cellView,
        detailView
        ].forEach { contentView.addView($0) }
        
//        [
//            containerView
//        ].forEach { contentView.addView($0)}
        
//        [
//        cellView,
////        detailView,
//        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
    }
    
    func constraintViews() {
        
        cellView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        detailView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(cellView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        
//        containerView.snp.makeConstraints {
//            $0.leading.equalTo(contentView.snp.leading)
//            $0.top.equalTo(contentView.snp.top)
//            $0.trailing.equalTo(contentView.snp.trailing)
//            $0.bottom.equalTo(contentView.snp.bottom)
//        }
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
