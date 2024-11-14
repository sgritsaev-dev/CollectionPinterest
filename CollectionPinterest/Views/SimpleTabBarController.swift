//
//  SimpleTabBarController.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 14.11.2024.
//

import UIKit

final class SimpleTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let CollectionViewController = CollectionPinterestViewController(collectionViewLayout: UICollectionViewFlowLayout())
        CollectionViewController.tabBarItem = UITabBarItem(title: "collection", image: UIImage(systemName: "table.fill"), tag: 1)
        
        let TableViewController = OrdersTableViewController()
        TableViewController.tabBarItem = UITabBarItem(title: "other", image: UIImage(systemName: "checkmark.rectangle.stack.fill"), tag: 2)
        
//        let TableViewController = UINavigationController(rootViewController: OrdersTableViewController())
//        CollectionViewController.tabBarItem = UITabBarItem(title: "collection", image: UIImage(systemName: "table.fill"), tag: 1)
//        TableController.tabBarItem = UITabBarItem(title: "other", image: UIImage(systemName: "checkmark.rectangle.stack.fill"), tag: 2)
        // спросить зачем делать это через navigationcontroller, если можно обойтись без этого???
        
        viewControllers = [CollectionViewController, TableViewController]
        
        setupTabBarUI()
    }
    
    func setupTabBarUI() {
        tabBar.barTintColor = #colorLiteral(red: 0.1557275951, green: 0.1641358137, blue: 0.211732924, alpha: 1)
        // спросить почему при загрузке происходит дефолтная херня, таб бар всегда загружается белесо-бледным, и только после тапа меняется bgcolor -> потому что нужен tint color - вверху, а не bg color, а bg color внизу
        tabBar.backgroundColor = #colorLiteral(red: 0.1557275951, green: 0.1641358137, blue: 0.211732924, alpha: 1)
        
        // тем не менее во время скрола (не внизу) таббар бледнее... вопрос
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
    }
}
