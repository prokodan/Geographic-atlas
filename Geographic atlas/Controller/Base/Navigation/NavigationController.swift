//
//  NavigationController.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

final class NavigationController: UINavigationController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    //MARK: - Configuring methods
    
    private func configure() {
        view.backgroundColor = R.Colors.background
    }
    

}
