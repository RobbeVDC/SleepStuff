//
//  LoginCoordinator.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginCoordinator: Coordinator {
    
    func start() {
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        viewController.delegate = self
        self.navigationController.setViewControllers([viewController], animated: false)
    }
    
}

// MARK: - LoginViewControllerDelegate

extension LoginCoordinator: LoginViewControllerDelegate {
    func didTapLogin(userEmail: String, userPassword: String, viewController: LoginViewController) {
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            DispatchQueue.main.async { [weak self] in
                SVProgressHUD.dismiss()
                
                guard let `self` = self else { print("self gone in File: \(#file) on Line: \(#line) in Function: \(#function)"); return }
                
                //Start MainFlowCoordinator
                self.startMainCoordinator()
            }
        }
    }
    
    private func startMainCoordinator() {
        let coordinator = MainFlowCoordinator(navigationController: self.navigationController)
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
}
