//
//  SleepDiaryViewModel.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 05/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import Foundation

class SleepDiaryViewModel {
    
    let tableViewViewModel: SleepDiaryTableViewViewModel
    
    // MARK: - Init
    
    init() {
        self.tableViewViewModel = SleepDiaryTableViewViewModel()
    }
    
    // MARK: - Methods
    
    func title() -> String {
        return "Slaapdagboek"
    }
    
}
