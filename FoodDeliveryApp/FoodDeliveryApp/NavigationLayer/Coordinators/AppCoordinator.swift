//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Max on 30.07.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        //showOnboardingFlow()
        showMainFlow()
    }
    
    override func finish() {
      print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController = navigationController else {return}
        let onBoardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onBoardingCoordinator)
        onBoardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else {return}
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "command"), tag: 1)
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.clipboard"), tag: 2)
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        let profileCoordinator = HomeCoordinator(type: .profile, navigationController: profileNavigationController)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        
        let tabBarController = TabBarController(tabBarControlers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func CoordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
