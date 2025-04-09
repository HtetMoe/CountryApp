//
//  ViewController.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/8/25.
//

import UIKit
import Combine
import Alamofire

class CountriesViewController: UIViewController {
    
    private var tableView: UITableView!
    private var searchController: UISearchController!
    
    private var viewModel    = CountriesViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Countries"
        
        setupTableView()
        setupSearchController()
        
        //observe changes
        viewModel.$filteredCountries
            .sink { [weak self] _ in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            .store(in: &cancellables)
        
        //fetch
        viewModel.fetchCountries()
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register( CountryTableViewCell.self,
                            forCellReuseIdentifier: CountryTableViewCell.identifier)
        
        tableView.dataSource = self
        tableView.rowHeight  = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name or capital"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension CountriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = viewModel.filteredCountries[indexPath.row]
        
        let cell = tableView.dequeueReusableCell( withIdentifier: CountryTableViewCell.identifier, for: indexPath) as! CountryTableViewCell
        cell.configure(with: country)
        
        return cell
    }
}

extension CountriesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        
        viewModel.searchCountries(query: query)
    }
}

