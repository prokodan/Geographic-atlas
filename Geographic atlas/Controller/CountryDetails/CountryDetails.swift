//
//  CountryDetails.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 13.05.2023.
//

import UIKit

class CountryDetails: GABaseController {
    //MARK: - Initialization
    let detailsView = CountryDetailsView()
    var dataModel: Country?
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = dataModel?.name.common
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

    //MARK: - BaseMethods
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
        
        detailsView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = .white
        
        guard dataModel != nil else { return }
        detailsView.configure(withDataModel: dataModel!)
        detailsView.addTargetToCoordinatesValue()
    }
}




