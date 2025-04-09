//
//  CountryRepository.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/9/25.
//

import Alamofire
import Combine
import Foundation

protocol CountryRepository {
    func fetchCountries() -> AnyPublisher<[Country], Error>
}




