//
//  OnBoardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Max on 30.07.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
      print("AppCoordinator finish")
    }
}

