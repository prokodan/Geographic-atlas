//
//  GAButton.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 13.05.2023.
//

import UIKit

final class GAButton: UIButton {
    
    //MARK: - Initialization
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.buttonTextColor
        label.font = R.Fonts.sFProSemiBold(with: 17)
        return label
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
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

    //MARK: - BaseMethods

private extension GAButton {
    
    func setupViews() {
        [
            label
        ].forEach {addView($0)}
    }
    
    func constraintViews() {
        label.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.centerX.equalTo(self.snp.centerX)
        }
    }
    
    func configureAppearance() {
        backgroundColor = .clear
        makeSystem(self)
    }
}
