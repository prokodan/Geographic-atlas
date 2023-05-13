//
//  SectionHeaderView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProBold(with: 15)
        label.textColor = R.Colors.headerText
        label.textAlignment = .left
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
    
    func configure(with data: String) {
        title.text = data.uppercased()
    }
}

private
extension SectionHeaderView {
    func setupViews() {
        [
            title
        ].forEach { addView($0) }
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            title.topAnchor.constraint(equalTo: topAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureAppearance() {}
    
}
