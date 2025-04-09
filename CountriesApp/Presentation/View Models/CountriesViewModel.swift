//
//  CountriesViewModel.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/8/25.
//

import Combine

class CountriesViewModel: ObservableObject {
    private var fetchCountriesUseCase: FetchCountriesUseCase
    private var countryRepository: CountryRepository
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var filteredCountries: [Country] = []
    private var countries: [Country] = []
    
    init() {
        let injection = Injection.shared
        self.countryRepository =  injection.countryRepository
        self.fetchCountriesUseCase = injection.fetchCountriesUseCase
    }
    
    //fetch countries
    func fetchCountries() {
        fetchCountriesUseCase.execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching countries: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] countries in
                self?.countries = countries
                self?.filteredCountries = countries
            })
            .store(in: &cancellables)
    }
    
    //search countries
    func searchCountries(query: String) {
        filteredCountries = query.isEmpty ? countries : countries.filter {
            $0.name.lowercased().contains(query.lowercased()) ||
            ($0.capital?.lowercased().contains(query.lowercased()) ?? false)
        }
    }
}





