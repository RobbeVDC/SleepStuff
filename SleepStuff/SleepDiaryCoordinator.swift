//
//  SleepDiaryCoordinator.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 05/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

class SleepDiaryCoordinator: Coordinator {
    
    func start() {
        let viewModel = SleepDiaryViewModel()
        let viewController = SleepDiaryViewController(viewModel: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
}
