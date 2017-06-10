//
//  AppCoordinator.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    func start() {   
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)
        loginCoordinator.start()
        self.childCoordinators.append(loginCoordinator)
    }
    
}
