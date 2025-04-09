//
//  FetchCountriesUseCase.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/9/25.
//

import Foundation
import Combine

protocol FetchCountriesUseCase {
    func execute() -> AnyPublisher<[Country], Error>
}
