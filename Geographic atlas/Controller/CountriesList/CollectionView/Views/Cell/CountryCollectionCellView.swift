//
//  CountryCollectionCellView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

final class CountryCollectionCellView: GABaseView {
    
    private let imageFlagView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProSemiBold(with: 17)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 13)
        label.textColor = R.Colors.secondaryText
        label.textAlignment = .left
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    private let imageArrowView: UIImageView = {
       let view = UIImageView()
        view.image = R.Pictures.Cell.arrowDown
        return view
    }()
    
    private var imageURL: URL? {
        didSet {
            imageFlagView.image = nil
            updateImage()
        }
    }
    
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
    
    func configure(withName name: String, andCapital capital: String, andImageURL imageURL: URL) {
        self.nameLabel.text = name
        self.capitalLabel.text = capital
        self.imageURL = imageURL
        setDownArrowImage()
    }
    
    func setUpArrowImage() {
        self.imageArrowView.image = R.Pictures.Cell.arrowDown
    }
    
    func setDownArrowImage() {
        self.imageArrowView.image = R.Pictures.Cell.arrowUp
    }
}
 
extension CountryCollectionCellView {
    override func setupViews() {
        super.setupViews()
        [
        nameLabel,
        capitalLabel
        ].forEach { stackView.addArrangedSubview($0) }
        
        [
        imageFlagView,
        stackView,
        imageArrowView
        ].forEach { addView($0) }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            imageFlagView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
//            imageFlagView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageFlagView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            imageFlagView.heightAnchor.constraint(equalToConstant: 48),
            imageFlagView.widthAnchor.constraint(equalToConstant: 82),
            
            stackView.leadingAnchor.constraint(equalTo: imageFlagView.trailingAnchor, constant: 12),
//            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: imageArrowView.leadingAnchor, constant: -12),
            
//            imageArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageArrowView.topAnchor.constraint(equalTo: topAnchor, constant: 32.25),
            imageArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17.25),
            imageArrowView.heightAnchor.constraint(equalToConstant: 7.5),
            imageArrowView.widthAnchor.constraint(equalToConstant: 13.5),
            
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        imageFlagView.roundCorners(with: 12, and: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
    }
    
    func updateImage() {
        guard let imageURL = imageURL else { return }
        getImage(fromURL: imageURL) { result in
            switch result {
            case .success(let image):
//                if imageURL == self.imageURL {
//                }
                self.imageFlagView.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

private
extension CountryCollectionCellView {
    
    func getImage(fromURL url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
//        if let cacheImage = CacheManager.shared.object(forKey: url.lastPathComponent as NSString) {
//            completion(.success(cacheImage))
//        }
        
        NetworkManager.shared.imageFetchRequest(url) { result in
            switch result {
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else  { return }
//                CacheManager.shared.setObject(image, forKey: url.lastPathComponent as NSString)
                completion(.success(image))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
