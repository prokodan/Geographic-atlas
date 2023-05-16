//
//  String + extension.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 15.05.2023.
//

import Foundation

extension String {
    ///Formatting Int data to String for  population label
    static func convertIntWithPrefix(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        if number >= 1_000_000_000 {
            let billionNumber = Double(number) / 1_000_000_000
            let formattedNumber = formatter.string(from: NSNumber(value: billionNumber)) ?? ""
            return "\(formattedNumber) bln"
        } else if number >= 1_000_000 {
            let millionNumber = Double(number) / 1_000_000
            let formattedNumber = formatter.string(from: NSNumber(value: millionNumber)) ?? ""
            return "\(formattedNumber) mln"
        } else {
            let formattedNumber = formatter.string(from: NSNumber(value: number)) ?? ""
            return formattedNumber
        }
    }
    ///Formatting Double data to String for  area label
    static func convertDoubleWithPrefix(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        if number >= 1_000_000_000 {
            let billionArea = number / 1_000_000_000
            let formattedArea = formatter.string(from: NSNumber(value: billionArea)) ?? ""
            return "\(formattedArea) bln km\u{00B2}"
        } else if number >= 1_000_000 {
            let millionArea = number / 1_000_000
            let formattedArea = formatter.string(from: NSNumber(value: millionArea)) ?? ""
            return "\(formattedArea) mln km\u{00B2}"
        } else {
            let formattedArea = formatter.string(from: NSNumber(value: number)) ?? ""
            return "\(formattedArea) km\u{00B2}"
        }
    }
    ///Formatting Double data to String for coordinates label
    static func convertDoubleToDegrees(_ coordinates: [Double]?) -> String {
        let lat = coordinates?.first ?? 0.0
        let lon = coordinates?.last ?? 0.0
            
        let latDegrees = Int(lat)
        let latMinutes = Double(lat) - Double(latDegrees)
        let latMinutesString = String(format: "%.0f" ,abs(latMinutes.truncatingRemainder(dividingBy: 1) * 100))
        
        let lonDegrees = Int(lon)
        let lonMinutes = Double(lon) - Double(lonDegrees)
        let lonMinutesString = String(format: "%.0f" ,abs(lonMinutes.truncatingRemainder(dividingBy: 1) * 100))
        return "\(latDegrees)\u{00B0}\(latMinutesString)', \(lonDegrees)\u{00B0}\(lonMinutesString)'"
    }
    
    enum WrappingType: String {
        case singleLine = ", "
        case multiLine = "\n"
    }
    ///Formatting currencies data to String for currencies label
    static func convertCurernciesToString(_ currencies: Currencies?, andWrappingType wrappingType: WrappingType = .singleLine) -> String {
        var namesAndSymbols: [(name: String, symbol: String?)] = []
        if let currencies = currencies {
            let currenciesMirror = Mirror(reflecting: currencies)
            if currenciesMirror.displayStyle == .struct {
                for case let (_, value) in currenciesMirror.children {
                    if let currency = value as? Currency {
                        let name = currency.name
                        let symbol = currency.symbol
                        namesAndSymbols.append((name: name, symbol: symbol))
                    }
                }
            }
        }
        return namesAndSymbols.map {"\($0.name) \($0.symbol ?? "")"}.joined(separator: wrappingType.rawValue)
    }
    
}
