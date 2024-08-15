//
//  Coordinator.swift
//  FoodDeliveryApp
//
//  Created by Max on 30.07.2024.
//

import UIKit

enum CoordinatorTypes {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] {get set}
    var type: CoordinatorTypes {get}
    var navigationController: UINavigationController? {get set}
    var finishDelegate: CoordinatorFinishDelegate? {get set}
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childcoordinator: CoordinatorProtocol) {
        childCoordinators.append(childcoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter{$0 !== childCoordinator}
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func CoordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}


protocol TabBarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarController: UIViewController? {get set}
}

class Coordinator: CoordinatorProtocol{
    
    var childCoordinators: [CoordinatorProtocol]
    var type: CoordinatorTypes
    var navigationController: UINavigationController?
    var finishDelegate: CoordinatorFinishDelegate?
    
    init(childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), type: CoordinatorTypes, navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate? = nil) {
        self.childCoordinators = childCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    deinit {
        print("Coordinator deinited \(type)")
        childCoordinators.forEach({$0.finishDelegate = nil})
        childCoordinators.removeAll()
    }
    
    func start() {
        print("Coordinator started")
    }
    
    func finish() {
        print("Coordinator finished")
    }
    
}
