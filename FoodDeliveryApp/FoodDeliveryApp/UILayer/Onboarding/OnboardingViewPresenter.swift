//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Max on 14.08.2024.
//

import Foundation


protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    // MARK: - Onboar
    weak var coordinator: OnboardingCoordinator!
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
}
