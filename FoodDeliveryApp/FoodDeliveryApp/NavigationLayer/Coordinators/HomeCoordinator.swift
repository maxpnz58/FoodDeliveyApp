//
//  HomeCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Max on 31.07.2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
      print("AppCoordinator finish")
    }
}
