//
//  Resources.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

typealias R = Resources
enum Resources {
    
    enum Colors {
        static let background = UIColor(hexString: "#FFFFFF")
        static let contentBackground = UIColor(hexString: "#F7F8F9")
        static let navBarBackgrpond = UIColor(hexString: "#F9F9F9").withAlphaComponent(0.94)
        
        static let separatorColor = UIColor(hexString: "#3C3C43").withAlphaComponent(0.36)
        
        static let primaryText = UIColor(hexString: "#000000")
        static let secondaryText = UIColor(hexString: "#88888888")
        static let headerText = UIColor(hexString: "#ABB3BB")
        
        static let buttonTextColor = UIColor(hexString: "#007AFF")
        
    }
    
    enum Pictures {
        enum Cell {
            static let flagPicture = UIImage(named: "raceFlag")
            static let arrowUp = UIImage(named: "upArrow")
            static let arrowDown = UIImage(named: "downArrow")
        }
    }
    
    enum Strings {
        enum NavBar {
            static let countriesListTitle = "World Countries"
        }
        enum Cell {
            static let populationLabel = "Population"
            static let areaLabel = "Area"
            static let currenciesLabel = "Currencies"
            static let buttonTextLabel = "Learn more"
        }
        
        enum Details {
            static let regionLabel = "Region"
            static let capitalLabel = "Capital"
            static let capitalCoordinates = "Capital coordinates"
            static let populationLabel = "Population"
            static let areaLabel = "Area"
            static let currencyLabel = "Currency"
            static let timezonesLabel = "Timezones"
        }
    }
    
    enum Fonts {
        static func sFProBold(with size: CGFloat) -> UIFont {
            UIFont.boldSystemFont(ofSize: size)
        }
        static func sFProSemiBold(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .semibold)
        }
        static func sFProRegular(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
}
