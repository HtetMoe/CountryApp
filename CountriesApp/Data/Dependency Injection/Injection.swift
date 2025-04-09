//
//  Injection.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/9/25.
//

import Foundation

class Injection {
    
    // Singleton
    static let shared = Injection()
    
    private init() {}
    
    //define all dependencies here
    var apiService: APIService {
        return APIServiceImpl()
    }
    
    var countryRepository: CountryRepository {
        return CountryRepositoryImpl(apiService: apiService)
    }
    
    var fetchCountriesUseCase: FetchCountriesUseCase {
        return FetchCountriesUseCaseImpl(countryRepository: countryRepository)
    }
}
