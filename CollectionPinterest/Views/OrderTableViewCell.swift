//
//  OrdersTableViewCell.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 16.11.2024.
//

import UIKit

final class OrderCell: UITableViewCell {
    static let identifier = "OrderCell"

    private let cellContent = UIView()
    private let restaurantLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    private let priceLabel: UILabel = UILabel()
    private let statusLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayer()
        
    }
    
    func setupUI() {
        contentView.backgroundColor = #colorLiteral(red: 0.4592262506, green: 0.5283014178, blue: 0.7002335191, alpha: 1)
        cellContent.backgroundColor = .white
        
        cellContent.layer.shadowColor = UIColor.darkGray.cgColor
        cellContent.layer.shadowOpacity = 0.2
        cellContent.layer.shadowRadius = 2
        cellContent.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellContent.layer.cornerRadius = 20
        cellContent.layer.borderWidth = 0.5
        cellContent.layer.borderColor = UIColor.lightGray.cgColor

        restaurantLabel.font = .boldSystemFont(ofSize: 18)
        
        dateLabel.font = .systemFont(ofSize: 12)
        
        priceLabel.font = .boldSystemFont(ofSize: 14)
        
        statusLabel.font = .systemFont(ofSize: 12)
    }
    
    func setupLayer() {
        contentView.addSubview(cellContent)
        cellContent.addSubview(restaurantLabel)
        cellContent.addSubview(dateLabel)
        cellContent.addSubview(priceLabel)
        cellContent.addSubview(statusLabel)
        
        cellContent.translatesAutoresizingMaskIntoConstraints = false
        restaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cellContent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        cellContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        cellContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
        cellContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        restaurantLabel.leadingAnchor.constraint(equalTo: cellContent.leadingAnchor, constant: 10).isActive = true
        restaurantLabel.topAnchor.constraint(equalTo: cellContent.topAnchor, constant: 10).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: cellContent.leadingAnchor, constant: 10).isActive = true
        dateLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 0).isActive = true
        
        priceLabel.trailingAnchor.constraint(equalTo: cellContent.trailingAnchor, constant: -10).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 0).isActive = true
        
        statusLabel.trailingAnchor.constraint(equalTo: cellContent.trailingAnchor, constant: -10).isActive = true
        statusLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with order: Order) {
        restaurantLabel.text = order.restaurant
        dateLabel.text = order.date
        priceLabel.text = order.price
        statusLabel.text = order.status
        setStatusTextColor()
    }
    
    func setStatusTextColor() {
        switch statusLabel.text {
        case "Delivered":
            statusLabel.textColor = .systemGreen
        case "Cancelled":
            statusLabel.textColor = .systemRed
        case "Pickup":
            statusLabel.textColor = .systemOrange
        default:
            statusLabel.textColor = .black
        }
    }
}
