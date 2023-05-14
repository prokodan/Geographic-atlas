//
//  CountryDetails.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 13.05.2023.
//

import UIKit

class CountryDetails: GABaseController {
    
    let detailsView = CountryDetailsView()
    var dataSource: MockData.Countries?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = dataSource?.name
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc
extension CountryDetails {
    
    override func setupViews() {
        super.setupViews()
        [
        detailsView
        ].forEach { view.addView($0) }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = .white
        detailsView.configure(withData: dataSource!)
    }
}



