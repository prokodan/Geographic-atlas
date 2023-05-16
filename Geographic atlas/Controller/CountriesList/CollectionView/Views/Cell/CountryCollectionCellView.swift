//
//  CountryCollectionCellView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit
import SnapKit

final class CountryCollectionCellView: GABaseView {
    
    //MARK: - Initialization
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
    
    //MARK: - Configuring methods
    
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

//MARK: - BaseView Methods
 
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
        
        imageFlagView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalToSuperview().offset(12)
            $0.height.equalTo(48)
            $0.width.equalTo(82)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(imageFlagView.snp.trailing).offset(12)
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalTo(imageArrowView.snp.leading).offset(-12)
        }
        
        imageArrowView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32.25)
            $0.trailing.equalToSuperview().offset(-17.25)
            $0.height.equalTo(7.5)
            $0.width.equalTo(13.5)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        imageFlagView.roundCorners(with: 12, and: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
    }
    
    //MARK: - Updating image
    
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

    //MARK: - GetImage & Cacheing methods
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
