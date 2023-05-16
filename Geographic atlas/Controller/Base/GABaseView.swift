//
//  GABaseView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

class GABaseView: UIView {
    
    //MARK: - Lifecycle
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
}

    //MARK: - BaseMethods
@objc
extension GABaseView {
    
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureAppearance() {}
}
