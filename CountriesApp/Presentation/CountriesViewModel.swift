//
//  CountriesViewModel.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/8/25.
//

import Alamofire
import Combine
import Foundation

class CountriesViewModel {
    @Published var filteredCountries: [Country] = []
    private var countries: [Country] = []

    func fetchCountries() {
        let url = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
        
        AF.request(url)
            .validate()
            .responseDecodable(of: [Country].self) { [weak self] response in
                switch response.result {
                case .success(let countries):
                    self?.countries = countries
                    self?.filteredCountries = countries
                case .failure:
                    self?.filteredCountries = []
                }
            }
    }
    
    func searchCountries(query: String) {
        if query.isEmpty {
            filteredCountries = countries  // Show all countries when search keyword is empty
        } else {
            filteredCountries = countries.filter {
                $0.name.lowercased().contains(query.lowercased()) || ($0.capital?.lowercased().contains(query.lowercased()) ?? false)
            }
        }
    }

}
