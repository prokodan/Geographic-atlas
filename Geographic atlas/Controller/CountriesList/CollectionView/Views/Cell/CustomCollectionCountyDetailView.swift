//
//  CustomCollectionCountyDetailView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

final class CustomCollectionCountyDetailView: GABaseView {
    
    private let populationLabel: UILabel = {
        let label = UILabel()
        label.text = "\(R.Strings.Cell.populationLabel):"
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.textAlignment = .left
        return label
    }()
    private let populationValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    private let areaLabel: UILabel = {
        let label = UILabel()
        label.text = "\(R.Strings.Cell.areaLabel):"
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.textAlignment = .left
        return label
    }()
    private let areaValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    private let currenciesLabel: UILabel = {
        let label = UILabel()
        label.text = "\(R.Strings.Cell.currenciesLabel):"
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.textAlignment = .left
        return label
    }()
    private let currenciesValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
//
        return label
    }()
    private let button = GAButton()
    
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
    
    func configure(withPopulation population: String, andArea area: String, andCurrencies currencies: Currencies?) {
        populationValueLabel.text = population
        areaValueLabel.text = area
        currenciesValueLabel.text = String.convertCurernciesToString(currencies, andWrappingType: .singleLine)
        button.setTitle(R.Strings.Cell.buttonTextLabel)
    }
    
    func addButtonTarget(target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

extension CustomCollectionCountyDetailView {
    override func setupViews() {
        super.setupViews()
        [
            populationLabel,
            populationValueLabel,
            areaLabel,
            areaValueLabel,
            currenciesLabel,
            currenciesValueLabel,
            button
        ].forEach { addView($0) }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            populationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            populationLabel.topAnchor.constraint(equalTo: topAnchor),
            populationLabel.trailingAnchor.constraint(equalTo: populationValueLabel.leadingAnchor, constant: -4),
            populationValueLabel.topAnchor.constraint(equalTo: populationLabel.topAnchor),
            
            areaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            areaLabel.topAnchor.constraint(equalTo: populationLabel.bottomAnchor, constant: 8),
            areaLabel.trailingAnchor.constraint(equalTo: areaValueLabel.leadingAnchor, constant: -4),
            areaValueLabel.topAnchor.constraint(equalTo: areaLabel.topAnchor),
//
            currenciesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            currenciesLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 8),
            currenciesLabel.trailingAnchor.constraint(equalTo: currenciesValueLabel.leadingAnchor, constant: -4),
            currenciesValueLabel.topAnchor.constraint(equalTo: currenciesLabel.topAnchor),
//
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            button.topAnchor.constraint(equalTo: currenciesLabel.bottomAnchor, constant: 12),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}

