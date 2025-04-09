//
//  APIService.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/9/25.
//

import Alamofire
import Combine
import Foundation

protocol APIService {
    func request(url: String) -> AnyPublisher<[Country], AFError>
}


class APIServiceImpl: APIService {
    func request(url: String) -> AnyPublisher<[Country], AFError> {
        return AF.request(url)
            .validate()
            .publishDecodable(type: [Country].self)
            .value()
            .eraseToAnyPublisher()
    }
}

