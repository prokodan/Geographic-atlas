//
//  CountriesModel.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 14.05.2023.
//

import Foundation

struct Country: Codable {
    let name: Name
    let cca2: String
    let currencies: Currencies?
    let capital: [String]?
    let region: Region
    let subregion: String?
    let area: Double
    let maps: Maps
    let population: Int
    let timezones: [String]
    let continents: [Continent]
    let flags: Flag
    let capitalInfo: CapitalInfo
}

struct Name: Codable {
    let common: String
}

struct Currencies: Codable {

    let eur, afn, sdg: Currency?
    let bgn, usd, pln, nzd: Currency?
    let tzs, mop, xof, czk: Currency?
    let ugx, ttd, dzd, uah: Currency?
    let mru, gel, ang, nad: Currency?
    let zar, mkd, mur, aud: Currency?
    let kid, xaf, qar, kyd: Currency?
    let bwp, egp, ils, jod: Currency?
    let vnd, gbp, jep, gyd: Currency?
    let tvd, pgk, bsd, cve: Currency?
    let omr, ves, bob, cad: Currency?
    let nok, kgs, amd, cdf: Currency?
    let chf, szl, dkk, fok: Currency?
    let ngn, mwk, stn, fkp: Currency?
    let gtq, bbd, ghs, nio: Currency?
    let imp, aoa, dop, all: Currency?
    let lyd, kwd, bhd, tmt: Currency?
    let lrd, rub, php, xcd: Currency?
    let ron, inr, mmk, bzd: Currency?
    let mnt, sar, huf, ars: Currency?
    let xpf, yer, sek, shp: Currency?
    let brl, ssp, thb: Currency?
    let bmd, bdt, sgd, mdl: Currency?
    let kes, uyu, byn, lbp: Currency?
    let btn, myr, kzt, tnd: Currency?
    let gmd, syp, gnf, mzn: Currency?
    let wst, twd, kpw, djf: Currency?
    let srd, rwf, krw, jmd: Currency?
    let mvr, pyg, idr, mga: Currency?
    let iqd, hnl, mad, hkd: Currency?
    let lkr, htg, cuc, cup: Currency?
    let tjs, ckd, cop, uzs: Currency?
    let gip, pen, pkr, clp: Currency?
    let zmw, scr, crc, kmf: Currency?
    let isk, jpy, fjd, bam: Currency?
    let mxn, khr, irr, rsd: Currency?
    let aed, azn, vuv, ern: Currency?
    let npr, pab, ggp, sbd: Currency?
    let zwl, awg, bnd, lak: Currency?
    let top, lsl, sos, sll: Currency?
    let bif, etb, cny, currenciesTRY: Currency?
    
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case eur = "EUR" ;case afn = "AFN"; case sdg = "SDG" ;case bgn = "BGN"
        case usd = "USD" ;case pln = "PLN" ;case nzd = "NZD" ;case tzs = "TZS"
        case mop = "MOP" ;case xof = "XOF" ;case czk = "CZK" ;case ugx = "UGX"
        case ttd = "TTD" ;case dzd = "DZD" ;case uah = "UAH" ;case mru = "MRU"
        case gel = "GEL" ;case ang = "ANG" ;case nad = "NAD" ;case zar = "ZAR"
        case mkd = "MKD" ;case mur = "MUR" ;case aud = "AUD" ;case kid = "KID"
        case xaf = "XAF" ;case qar = "QAR" ;case kyd = "KYD" ;case bwp = "BWP"
        case egp = "EGP" ;case ils = "ILS" ;case jod = "JOD" ;case vnd = "VND"
        case gbp = "GBP" ;case jep = "JEP" ;case gyd = "GYD" ;case tvd = "TVD"
        case pgk = "PGK" ;case bsd = "BSD" ;case cve = "CVE" ;case omr = "OMR"
        case ves = "VES" ;case bob = "BOB" ;case cad = "CAD" ;case nok = "NOK"
        case kgs = "KGS" ;case amd = "AMD" ;case cdf = "CDF" ;case chf = "CHF"
        case szl = "SZL" ;case dkk = "DKK" ;case fok = "FOK" ;case ngn = "NGN"
        case mwk = "MWK" ;case stn = "STN" ;case fkp = "FKP" ;case gtq = "GTQ"
        case bbd = "BBD" ;case ghs = "GHS" ;case nio = "NIO" ;case imp = "IMP"
        case aoa = "AOA" ;case dop = "DOP" ;case all = "ALL" ;case lyd = "LYD"
        case kwd = "KWD" ;case bhd = "BHD" ;case tmt = "TMT" ;case lrd = "LRD"
        case rub = "RUB" ;case php = "PHP" ;case xcd = "XCD" ;case ron = "RON"
        case inr = "INR" ;case mmk = "MMK" ;case bzd = "BZD" ;case mnt = "MNT"
        case sar = "SAR" ;case huf = "HUF" ;case ars = "ARS" ;case xpf = "XPF"
        case yer = "YER" ;case sek = "SEK" ;case shp = "SHP" ;case brl = "BRL"
        case ssp = "SSP" ;case thb = "THB" ;case bmd = "BMD" ;case bdt = "BDT"
        case sgd = "SGD" ;case mdl = "MDL" ;case kes = "KES" ;case uyu = "UYU"
        case byn = "BYN" ;case lbp = "LBP" ;case btn = "BTN" ;case myr = "MYR"
        case kzt = "KZT" ;case tnd = "TND" ;case gmd = "GMD" ;case syp = "SYP"
        case gnf = "GNF" ;case mzn = "MZN" ;case wst = "WST" ;case twd = "TWD"
        case kpw = "KPW" ;case djf = "DJF" ;case srd = "SRD" ;case rwf = "RWF"
        case krw = "KRW" ;case jmd = "JMD" ;case mvr = "MVR" ;case pyg = "PYG"
        case idr = "IDR" ;case mga = "MGA" ;case iqd = "IQD" ;case hnl = "HNL"
        case mad = "MAD" ;case hkd = "HKD" ;case lkr = "LKR" ;case htg = "HTG"
        case cuc = "CUC" ;case cup = "CUP" ;case tjs = "TJS" ;case ckd = "CKD"
        case cop = "COP" ;case uzs = "UZS" ;case gip = "GIP" ;case pen = "PEN"
        case pkr = "PKR" ;case clp = "CLP" ;case zmw = "ZMW" ;case scr = "SCR"
        case crc = "CRC" ;case kmf = "KMF" ;case isk = "ISK" ;case jpy = "JPY"
        case fjd = "FJD" ;case bam = "BAM" ;case mxn = "MXN" ;case khr = "KHR"
        case irr = "IRR" ;case rsd = "RSD" ;case aed = "AED" ;case azn = "AZN"
        case vuv = "VUV" ;case ern = "ERN" ;case npr = "NPR" ;case pab = "PAB"
        case ggp = "GGP" ;case sbd = "SBD" ;case zwl = "ZWL" ;case awg = "AWG"
        case bnd = "BND" ;case lak = "LAK" ;case top = "TOP" ;case lsl = "LSL"
        case sos = "SOS" ;case sll = "SLL" ;case bif = "BIF" ;case etb = "ETB";
        case cny = "CNY" ;case currenciesTRY = "TRY"
    }
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

struct Currency: Codable {
    let name: String
    let symbol: String?
}

struct Maps: Codable {
    let openStreetMaps, googleMaps: String
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

struct Flag: Codable {
    let png: String
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}

