//
//  MainFlowCoordinator.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 04/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

class MainFlowCoordinator: Coordinator {
    
    func start() {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        viewController.delegate = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - MainViewControllerDelegate

extension MainFlowCoordinator: MainViewControllerDelegate {
    
    func didTapLogout(viewController: MainViewController) {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
 
    func didTapSleepDiary(viewController: MainViewController) {
        let coordinator = SleepDiaryCoordinator(navigationController: self.navigationController)
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
}
