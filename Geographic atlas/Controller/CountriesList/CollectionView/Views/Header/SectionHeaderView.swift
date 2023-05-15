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
        title.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(2)
            $0.top.equalToSuperview()
            $0.centerY.equalTo(self.snp.centerY)
            $0.trailing.equalToSuperview().offset(-2)
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureAppearance() {}
    
}
