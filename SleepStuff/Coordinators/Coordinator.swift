//
//  Coordinator.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

class Coordinator: NSObject {
    
    var navigationController: UINavigationController
    var childCoordinators: [NSObject] = [NSObject]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
 
    func removeCoordinator(coordinator: Coordinator?) {
        if let coordinator = coordinator {
            if self.childCoordinators.removeObject(coordinator) {
                print("Removed coordinator \(type(of: coordinator))")
            } else {
                print("Removing coordinator \(type(of: coordinator)) failed, probably the coordinator was not added to the childCoordinators array.. :(")
            }
        }
    }
    
}
