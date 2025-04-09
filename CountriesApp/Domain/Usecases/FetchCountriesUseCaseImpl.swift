//
//  FetchCountriesUseCaseImpl.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/9/25.
//

import Foundation
import Combine

class FetchCountriesUseCaseImpl: FetchCountriesUseCase {
    private let countryRepository: CountryRepository
    
    init(countryRepository: CountryRepository) {
        self.countryRepository = countryRepository
    }
    
    func execute() -> AnyPublisher<[Country], Error> {
        return countryRepository.fetchCountries()
    }
}
