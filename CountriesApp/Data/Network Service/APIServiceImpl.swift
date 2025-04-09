//
//  APIServiceImpl.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/9/25.
//

import Foundation
import Combine
import Alamofire

class APIServiceImpl: APIService {
    
    func request<T: Decodable>(_ url: String, type: T.Type) -> AnyPublisher<T, Error> {
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
