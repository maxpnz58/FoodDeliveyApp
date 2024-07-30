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
