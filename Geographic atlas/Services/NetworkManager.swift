//
//  NetworkManager.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 14.05.2023.
//

import Foundation
import Alamofire

enum Links: String {
    case allcountries = "https://restcountries.com/v3.1/all"
    case countryCCA2 = "https://restcountries.com/v3.1/alpha/"
    case streetMapLink = "https://www.openstreetmap.org/#map=9"
    case dummyTriangle = "https://www.openstreetmap.org/#map=9/25.23/-70.99"
    case flagPlaceholer = "https://imageup.ru/img292/4340941/tempimagegs7wpn.jpg"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    ///Fetching data for the list of countries
    func fetchRequest(_ url: String, completion: @escaping (Result<[Country], Error> ) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: [Country].self) { response in
                switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    ///Fetching image data
    func imageFetchRequest(_ url: URL, completion: @escaping (Result<Data, Error> ) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(_):
                    guard let imageData = dataResponse.data else { return }
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    ///Fetching data for the country via cca2 code
    func fetchRequest(_ url: String, andCCA2Code code: String, completion: @escaping (Result<[Country], Error> ) -> Void) {
        AF.request(url + "\(code)")
            .validate()
            .responseDecodable(of: [Country].self) {response in
                switch response.result {
                case .success(let coutryModel):
                    completion(.success(coutryModel))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    

    
}
