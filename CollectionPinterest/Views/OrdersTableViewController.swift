//
//  OrdersTableViewController.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 16.11.2024.
//

import UIKit

final class OrdersTableViewController: UITableViewController {
    
    private let ordersHeader = UIView()
    private let ordersTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTableView()
    }
    
    private func setupTitle() {
        
        ordersTitle.text = "Orders"
        ordersTitle.font = .boldSystemFont(ofSize: 44)
        
        view.addSubview(ordersHeader)
        ordersHeader.addSubview(ordersTitle)

        ordersHeader.translatesAutoresizingMaskIntoConstraints = false
        ordersTitle.translatesAutoresizingMaskIntoConstraints = false
        
        ordersHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        ordersHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        ordersHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        ordersHeader.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
        
        ordersTitle.topAnchor.constraint(equalTo: ordersHeader.topAnchor, constant: 0).isActive = true
        ordersTitle.leadingAnchor.constraint(equalTo: ordersHeader.leadingAnchor, constant: 32).isActive = true
        ordersTitle.trailingAnchor.constraint(equalTo: ordersHeader.trailingAnchor, constant: -32).isActive = true
        ordersTitle.bottomAnchor.constraint(equalTo: ordersHeader.bottomAnchor, constant: 0).isActive = true
    }
    private func setupTableView() {
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0.4592262506, green: 0.5283014178, blue: 0.7002335191, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.identifier, for: indexPath) as? OrderCell else { fatalError("failed to deque cell") }
        let order = orders[indexPath.row]
        cell.configure(with: order)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ordersHeader
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
