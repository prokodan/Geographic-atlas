//
//  GABaseController.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

class GABaseController: UIViewController {
    
    //MARK: - LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

    //MARK: - BaseMethods

@objc
extension GABaseController {
    
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureAppearance() {
        view.backgroundColor = R.Colors.background
    }
}
