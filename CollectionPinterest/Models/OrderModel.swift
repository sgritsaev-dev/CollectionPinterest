//
//  OrderModel.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 16.11.2024.
//

import UIKit

struct Order {
    let number: Int
    let restaurant: String
    let date: String
    let price: String
    let status: OrderStatus
}

enum OrderStatus: String {
    case delivered = "Delivered"
    case cancelled = "Cancelled"
    case pickup = "Pickup"
}
