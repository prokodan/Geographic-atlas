//
//  CountryDetailsView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 13.05.2023.
//

import UIKit

class CountryDetailsView: GABaseView {
    
    private let imageFlagView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.roundCorners(with: 8, and: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
        return view
    }()
    
    private let regionLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.regionLabel):"
        label.textAlignment = .left
        return label
    }()
    private let regionValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.capitalLabel):"
        label.textAlignment = .left
        return label
    }()
    private let capitalValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let capitalCoordinatesLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.capitalCoordinates):"
        label.textAlignment = .left
        return label
    }()
    private let capitalCoordinatesValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let populationLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.populationLabel):"
        label.textAlignment = .left
        return label
    }()
    private let populationValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let areaLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.areaLabel):"
        label.textAlignment = .left
        return label
    }()
    private let areaValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.currencyLabel):"
        label.textAlignment = .left
        return label
    }()
    private let currencyValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private let timezoneLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.timezonesLabel):"
        label.textAlignment = .left
        return label
    }()
    private let timezoneValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let bulletOne: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletTwo: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletThree: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletFour: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletFive: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletSix: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletSeven: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        
        return view
    }()

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
    
    func configure(withImage image: UIImage, andRegion region: String, andCapital capital: String, andCapitalCoordinates coordinates: String, andPopulation population: String, andArea area: String, andCurrency currency: String, andTimezones timezones: [String]) {
        self.imageFlagView.image = image
        self.regionValueLabel.text = region
        self.capitalValueLabel.text = capital
        self.capitalCoordinatesValueLabel.text = coordinates
        self.populationValueLabel.text = population
        self.areaValueLabel.text = area
        self.currencyValueLabel.text = currency
        self.timezoneValueLabel.text = timezones.joined(separator: ", ")
    }
    
    func configure(withData data: MockData.Countries) {
        self.imageFlagView.image = data.image
        self.regionValueLabel.text = data.region
        self.capitalValueLabel.text = data.capital
        self.capitalCoordinatesValueLabel.text = data.capitalCoordinates
        self.populationValueLabel.text = data.population
        self.areaValueLabel.text = data.area
        self.currencyValueLabel.text = data.currencies.joined(separator: "\n")
        self.timezoneValueLabel.text = data.timezones.joined(separator: "\n")
    }
}

@objc
extension CountryDetailsView {
    
    override func setupViews() {
        super.setupViews()
        
        [
            bulletOne,
            bulletTwo,
            bulletThree,
            bulletFour,
            bulletFive,
            bulletSix,
            bulletSeven
        ].forEach { containerView.addView($0)}
        
        [
            imageFlagView,
            regionLabel, regionValueLabel,
            capitalLabel, capitalValueLabel,
            capitalCoordinatesLabel, capitalCoordinatesValueLabel,
            populationLabel, populationValueLabel,
            areaLabel, areaValueLabel,
            currencyLabel, currencyValueLabel,
            timezoneLabel, timezoneValueLabel
        ].forEach { containerView.addView($0)}
        
        [
            containerView
        ].forEach{ scrollView.addView($0) }
        
        [
            scrollView
        ].forEach { addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -40),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageFlagView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageFlagView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageFlagView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageFlagView.heightAnchor.constraint(equalToConstant: 193),
            
            bulletOne.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bulletOne.topAnchor.constraint(equalTo: regionLabel.topAnchor),
            
            regionLabel.leadingAnchor.constraint(equalTo: bulletOne.trailingAnchor, constant: 8),
            regionLabel.topAnchor.constraint(equalTo: imageFlagView.bottomAnchor, constant: 20),
            regionValueLabel.leadingAnchor.constraint(equalTo: regionLabel.leadingAnchor),
            regionValueLabel.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 4),
            
            bulletTwo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bulletTwo.topAnchor.constraint(equalTo: capitalLabel.topAnchor),
            
            capitalLabel.leadingAnchor.constraint(equalTo: bulletTwo.trailingAnchor, constant: 8),
            capitalLabel.topAnchor.constraint(equalTo: regionValueLabel.bottomAnchor, constant: 24),
            capitalValueLabel.leadingAnchor.constraint(equalTo: capitalLabel.leadingAnchor),
            capitalValueLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 4),
            
            bulletThree.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bulletThree.topAnchor.constraint(equalTo: capitalCoordinatesLabel.topAnchor),
            
            capitalCoordinatesLabel.leadingAnchor.constraint(equalTo: bulletThree.trailingAnchor, constant: 8),
            capitalCoordinatesLabel.topAnchor.constraint(equalTo: capitalValueLabel.bottomAnchor, constant: 24),
            capitalCoordinatesValueLabel.leadingAnchor.constraint(equalTo: capitalCoordinatesLabel.leadingAnchor),
            capitalCoordinatesValueLabel.topAnchor.constraint(equalTo: capitalCoordinatesLabel.bottomAnchor, constant: 4),
            
            bulletFour.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bulletFour.topAnchor.constraint(equalTo: populationLabel.topAnchor),
            
            populationLabel.leadingAnchor.constraint(equalTo: bulletFour.trailingAnchor, constant: 8),
            populationLabel.topAnchor.constraint(equalTo: capitalCoordinatesValueLabel.bottomAnchor, constant: 24),
            populationValueLabel.leadingAnchor.constraint(equalTo: populationLabel.leadingAnchor),
            populationValueLabel.topAnchor.constraint(equalTo: populationLabel.bottomAnchor, constant: 4),
            
            bulletFive.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bulletFive.topAnchor.constraint(equalTo: areaLabel.topAnchor),
            
            areaLabel.leadingAnchor.constraint(equalTo: bulletFive.trailingAnchor, constant: 8),
            areaLabel.topAnchor.constraint(equalTo: populationValueLabel.bottomAnchor, constant: 24),
            areaValueLabel.leadingAnchor.constraint(equalTo: areaLabel.leadingAnchor),
            areaValueLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 4),
            
            bulletSix.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bulletSix.topAnchor.constraint(equalTo: currencyLabel.topAnchor),
            
            currencyLabel.leadingAnchor.constraint(equalTo: bulletSix.trailingAnchor, constant: 8),
            currencyLabel.topAnchor.constraint(equalTo: areaValueLabel.bottomAnchor, constant: 24),
            currencyValueLabel.leadingAnchor.constraint(equalTo: currencyLabel.leadingAnchor),
            currencyValueLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 4),
            
            bulletSeven.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bulletSeven.topAnchor.constraint(equalTo: timezoneLabel.topAnchor),
            
            timezoneLabel.leadingAnchor.constraint(equalTo: bulletSeven.trailingAnchor, constant: 8),
            timezoneLabel.topAnchor.constraint(equalTo: currencyValueLabel.bottomAnchor, constant: 24),
            timezoneValueLabel.leadingAnchor.constraint(equalTo: timezoneLabel.leadingAnchor),
            timezoneValueLabel.topAnchor.constraint(equalTo: timezoneLabel.bottomAnchor, constant: 4),
            timezoneValueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
