//
//  CountryDetailsView.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 13.05.2023.
//

import UIKit
import SnapKit

class CountryDetailsView: GABaseView {
    //MARK: - Initialization
    private let imageFlagView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.roundCorners(with: 8, and: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
        return view
    }()
    
    private let regionLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.regionLabel):"
        label.textAlignment = .left
        return label
    }()
    private let regionValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.capitalLabel):"
        label.textAlignment = .left
        return label
    }()
    private let capitalValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let capitalCoordinatesLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.capitalCoordinates):"
        label.textAlignment = .left
        return label
    }()
    private let capitalCoordinatesValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        
        return label
    }()
    
    private let populationLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.populationLabel):"
        label.textAlignment = .left
        return label
    }()
    private let populationValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let areaLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.areaLabel):"
        label.textAlignment = .left
        return label
    }()
    private let areaValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        return label
    }()
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.currencyLabel):"
        label.textAlignment = .left
        return label
    }()
    private let currencyValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private let timezoneLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 15)
        label.textColor = R.Colors.secondaryText
        label.text = "\(R.Strings.Details.timezonesLabel):"
        label.textAlignment = .left
        return label
    }()
    private let timezoneValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.sFProRegular(with: 20)
        label.textColor = R.Colors.primaryText
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let bulletOne: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletTwo: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletThree: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletFour: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletFive: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletSix: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    private let bulletSeven: UIPaddingLabel = {
        let label = UIPaddingLabel()
        label.font = R.Fonts.sFProSemiBold(with: 8)
        label.textColor = R.Colors.primaryText
        label.text = "●"
        label.paddingBottom = 12
        label.paddingTop = 12
        label.paddingLeft = 12
        label.paddingRight = 12
        label.textAlignment = .center
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private var imageURL: URL? {
        didSet {
            imageFlagView.image = nil
            updateImage()
        }
    }
    
    private var mapsURL: URL?

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
    func configure(withDataModel dataModel: Country) {
        self.imageURL = URL(string:dataModel.flags.png)
        self.regionValueLabel.text = dataModel.subregion
        self.capitalValueLabel.text = dataModel.capital?.first ?? "No Capital"

        self.capitalCoordinatesValueLabel.text = String.convertDoubleToDegrees(dataModel.capitalInfo.latlng)
        self.populationValueLabel.text = String.convertIntWithPrefix(dataModel.population)
        self.areaValueLabel.text = String.convertDoubleWithPrefix(dataModel.area)
        self.timezoneValueLabel.text = dataModel.timezones.joined(separator: "\n")
        self.currencyValueLabel.text = String.convertCurernciesToString(dataModel.currencies, andWrappingType: .multiLine)
        self.mapsURL = handeMapData(withDataModel: dataModel)
        
        
    }
    ///Handling data for openMaps coordinates
    func handeMapData(withDataModel dataModel: Country) -> URL {
        guard let lat = dataModel.capitalInfo.latlng?.first, let lng = dataModel.capitalInfo.latlng?.last else { return URL(string: dataModel.maps.openStreetMaps) ?? URL(string: Links.dummyTriangle.rawValue)! }
        let latComponent = "/\(lat)"
        let lngComponent = "/\(lng)"
        return URL(string: "\(Links.streetMapLink.rawValue)\(latComponent)\(lngComponent)")!
    }
}
    //MARK: - BaseView Methods
@objc
extension CountryDetailsView {
    
    override func setupViews() {
        super.setupViews()
        
        [
            bulletOne,
            bulletTwo,
            bulletThree,
            bulletFour,
            bulletFive,
            bulletSix,
            bulletSeven
        ].forEach { containerView.addView($0)}
        
        [
            imageFlagView,
            regionLabel, regionValueLabel,
            capitalLabel, capitalValueLabel,
            capitalCoordinatesLabel, capitalCoordinatesValueLabel,
            populationLabel, populationValueLabel,
            areaLabel, areaValueLabel,
            currencyLabel, currencyValueLabel,
            timezoneLabel, timezoneValueLabel
        ].forEach { containerView.addView($0)}
        
        [
            containerView
        ].forEach{ scrollView.addView($0) }
        
        [
            scrollView
        ].forEach { addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        scrollView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            $0.top.equalTo(scrollView.contentLayoutGuide.snp.top).offset(20)
            $0.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            $0.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom).offset(-40)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        imageFlagView.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading)
            $0.top.equalTo(containerView.snp.top)
            $0.trailing.equalTo(containerView.snp.trailing)
            $0.height.equalTo(193)
        }
        
        bulletOne.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading)
            $0.top.equalTo(regionLabel.snp.top)
        }
        
        regionLabel.snp.makeConstraints {
            $0.leading.equalTo(bulletOne.snp.trailing).offset(8)
            $0.top.equalTo(imageFlagView.snp.bottom).offset(20)
        }
        
        regionValueLabel.snp.makeConstraints {
            $0.leading.equalTo(regionLabel.snp.leading)
            $0.top.equalTo(regionLabel.snp.bottom).offset(4)
        }
        
        bulletTwo.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading)
            $0.top.equalTo(capitalLabel.snp.top)
        }
        
        capitalLabel.snp.makeConstraints {
            $0.leading.equalTo(bulletTwo.snp.trailing).offset(8)
            $0.top.equalTo(regionValueLabel.snp.bottom).offset(24)
        }
        
        capitalValueLabel.snp.makeConstraints {
            $0.leading.equalTo(capitalLabel.snp.leading)
            $0.top.equalTo(capitalLabel.snp.bottom).offset(4)
        }
        
        bulletThree.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading)
            $0.top.equalTo(capitalCoordinatesLabel.snp.top)
        }
        
        capitalCoordinatesLabel.snp.makeConstraints {
            $0.leading.equalTo(bulletThree.snp.trailing).offset(8)
            $0.top.equalTo(capitalValueLabel.snp.bottom).offset(24)
        }
        
        capitalCoordinatesValueLabel.snp.makeConstraints {
            $0.leading.equalTo(capitalCoordinatesLabel.snp.leading)
            $0.top.equalTo(capitalCoordinatesLabel.snp.bottom).offset(4)
        }
        
        bulletFour.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading)
            $0.top.equalTo(populationLabel.snp.top)
        }
        
        populationLabel.snp.makeConstraints {
            $0.leading.equalTo(bulletFour.snp.trailing).offset(8)
            $0.top.equalTo(capitalCoordinatesValueLabel.snp.bottom).offset(24)
        }
        
        populationValueLabel.snp.makeConstraints {
            $0.leading.equalTo(populationLabel.snp.leading)
            $0.top.equalTo(populationLabel.snp.bottom).offset(4)
        }
        
        bulletFive.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading)
            $0.top.equalTo(areaLabel.snp.top)
        }
        
        areaLabel.snp.makeConstraints {
            $0.leading.equalTo(bulletFive.snp.trailing).offset(8)
            $0.top.equalTo(populationValueLabel.snp.bottom).offset(24)
        }
        
        areaValueLabel.snp.makeConstraints {
            $0.leading.equalTo(areaLabel.snp.leading)
            $0.top.equalTo(areaLabel.snp.bottom).offset(4)
        }
        
        bulletSix.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading)
            $0.top.equalTo(currencyLabel.snp.top)
        }
        
        currencyLabel.snp.makeConstraints {
            $0.leading.equalTo(bulletSix.snp.trailing).offset(8)
            $0.top.equalTo(areaValueLabel.snp.bottom).offset(24)
        }
        
        currencyValueLabel.snp.makeConstraints {
            $0.leading.equalTo(currencyLabel.snp.leading)
            $0.top.equalTo(currencyLabel.snp.bottom).offset(4)
        }
        
        bulletSeven.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading)
            $0.top.equalTo(timezoneLabel.snp.top)
        }
        
        timezoneLabel.snp.makeConstraints {
            $0.leading.equalTo(bulletSeven.snp.trailing).offset(8)
            $0.top.equalTo(currencyValueLabel.snp.bottom).offset(24)
        }
        
        timezoneValueLabel.snp.makeConstraints {
            $0.leading.equalTo(timezoneLabel.snp.leading)
            $0.top.equalTo(timezoneLabel.snp.bottom).offset(4)
            $0.bottom.equalTo(containerView.snp.bottom)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}


    //MARK: - Target methods
extension CountryDetailsView {
        func updateImage() {
            guard let imageURL = imageURL else { return }
            getImage(fromURL: imageURL) { result in
                switch result {
                case .success(let image):
                    self.imageFlagView.image = image
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
    func addTargetToCoordinatesValue() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTappedLabel))

        capitalCoordinatesValueLabel.isUserInteractionEnabled = true
        capitalCoordinatesValueLabel.addGestureRecognizer(tapGesture)
    }
    
    
    @objc
    func didTappedLabel() {
        print("Tapped")
        guard let safeURL = mapsURL else { return }
        UIApplication.shared.open(safeURL)
        
    }
}
    //MARK: - ImageDownloading
private
extension CountryDetailsView {
    func getImage(fromURL url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
        NetworkManager.shared.imageFetchRequest(url) { result in
            switch result {
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else  { return }
                completion(.success(image))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
