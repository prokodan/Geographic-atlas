//
//  CustomCollectionCountyDetailView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

final class CustomCollectionCountyDetailView: GABaseView {
    
    //MARK: - Initialization
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
    
    //MARK: - Configuring
    
    func configure(withPopulation population: String, andArea area: String, andCurrencies currencies: Currencies?) {
        populationValueLabel.text = population
        areaValueLabel.text = area
        currenciesValueLabel.text = String.convertCurernciesToString(currencies, andWrappingType: .singleLine)
        button.setTitle(R.Strings.Cell.buttonTextLabel)
    }
    
    //MARK: - Add target methods
    
    func addButtonTarget(target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

    //MARK: - BaseView methods

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
        
        populationLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalToSuperview()
        }
        populationValueLabel.snp.makeConstraints {
            $0.leading.equalTo(populationLabel.snp.trailing).offset(4)
            $0.top.equalTo(populationLabel.snp.top)
        }
        
        areaLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalTo(populationLabel.snp.bottom).offset(8)
        }
        areaValueLabel.snp.makeConstraints {
            $0.leading.equalTo(populationLabel.snp.trailing).offset(4)
            $0.top.equalTo(areaLabel.snp.top)
        }
        
        currenciesLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalTo(areaLabel.snp.bottom).offset(8)
        }
        currenciesValueLabel.snp.makeConstraints {
            $0.leading.equalTo(populationLabel.snp.trailing).offset(4)
            $0.top.equalTo(currenciesLabel.snp.top)
        }
        
        button.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalTo(currenciesLabel.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().offset(-12)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}

