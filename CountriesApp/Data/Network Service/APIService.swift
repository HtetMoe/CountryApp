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
    func request<T: Decodable>(_ url: String, type: T.Type) -> AnyPublisher<T, Error>
}


