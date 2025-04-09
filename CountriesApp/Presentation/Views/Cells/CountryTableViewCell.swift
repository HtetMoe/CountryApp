//
//  CountryTableViewCell.swift
//  CountriesApp
//
//  Created by Htet Moe Phyu on 4/8/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    static let identifier = "CountryCell"
    
    private let nameRegionLabel = UILabel()
    private let codeLabel = UILabel()
    private let capitalLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Configure labels and add them to the content view
        [nameRegionLabel, codeLabel, capitalLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
            contentView.addSubview($0)
        }
        
        // Configure nameRegionLabel with a darker text color
        nameRegionLabel.textColor = .darkGray // Make it darker
        nameRegionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        // Configure codeLabel (keeping it as is)
        codeLabel.textAlignment = .right
        
        // Configure capitalLabel to be smaller and dimmer
        capitalLabel.textColor = .gray // Make it dimmer
        capitalLabel.font = UIFont.systemFont(ofSize: 14) // Make the font smaller
        
        // Set up constraints in one place
        NSLayoutConstraint.activate([
            nameRegionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameRegionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameRegionLabel.trailingAnchor.constraint(equalTo: codeLabel.leadingAnchor, constant: -8),
            
            codeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            codeLabel.centerYAnchor.constraint(equalTo: nameRegionLabel.centerYAnchor),
            
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            capitalLabel.topAnchor.constraint(equalTo: nameRegionLabel.bottomAnchor, constant: 4),
            capitalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            capitalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with country: Country) {
        nameRegionLabel.text = "\(country.name), \(country.region)"
        codeLabel.text = country.code
        capitalLabel.text = country.capital ?? "No capital"
    }
}


