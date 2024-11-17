//
//  OrdersTableViewController.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 16.11.2024.
//

import UIKit

final class OrdersTableViewController: UITableViewController {
    
    private let ordersHeader = UIView()
    private var ordersTitle: UILabel = {
        let orderstitle = UILabel()
        orderstitle.text = "Orders"
        orderstitle.font = .boldSystemFont(ofSize: 44)
        return orderstitle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
    
    private func setupTableView() {
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Orders"
        let a = UINavigationBarAppearance()
        a.titlePositionAdjustment = .init(
           horizontal: -CGFloat.greatestFiniteMagnitude,
           vertical: 16
        )
        a.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 44)]
        navigationItem.scrollEdgeAppearance = a
        navigationItem.compactAppearance = a
        navigationItem.standardAppearance = a
    }
}

extension OrdersTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.identifier, for: indexPath) as? OrderCell else { return UITableViewCell() }
        let order = orders[indexPath.row]
        cell.configure(with: order)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
