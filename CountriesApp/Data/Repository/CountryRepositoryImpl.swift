//
//  CountryRepositoryImpl.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/9/25.
//

import Alamofire
import Combine
import Foundation

class CountryRepositoryImpl: CountryRepository {
    private var apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchCountries() -> AnyPublisher<[Country], Error> {
        return apiService.request(Endpoint.countries, type: [Country].self)
    }
}
