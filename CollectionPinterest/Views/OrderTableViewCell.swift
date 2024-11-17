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
    private let restaurantLabel = UILabel()
    private let dateLabel = UILabel()
    private let priceLabel = UILabel()
    private let statusLabel = UILabel()
    private var currentOrder: Order?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 100, left: 32, bottom: 100, right: 32))
    }
    
    private func setupUI() {
        cellContent.backgroundColor = .white
        
        cellContent.layer.shadowColor = UIColor.darkGray.cgColor
        cellContent.layer.shadowOpacity = 0.2
        cellContent.layer.shadowRadius = 10
        cellContent.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellContent.layer.cornerRadius = 15

        restaurantLabel.font = .boldSystemFont(ofSize: 18)
        dateLabel.font = .systemFont(ofSize: 12)
        priceLabel.font = .boldSystemFont(ofSize: 14)
        statusLabel.font = .systemFont(ofSize: 12)
    }
    
    private func setupLayer() {
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
        cellContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        cellContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        cellContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
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
        currentOrder = order
        restaurantLabel.text = currentOrder?.restaurant
        dateLabel.text = currentOrder?.date
        priceLabel.text = currentOrder?.price
        statusLabel.text = currentOrder?.status.rawValue
        statusLabel.textColor = textColor
    }
}

extension OrderCell {
    private var textColor: UIColor {
        switch currentOrder?.status {
        case .delivered:
            return .systemGreen
        case .cancelled:
            return .systemRed
        case .pickup:
            return .systemOrange
        default:
            return .black
        }
    }
}
