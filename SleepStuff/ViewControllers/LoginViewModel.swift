//
//  LoginViewModel.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import Foundation

enum LoginCellType {
    case username, password, loginButton
}

class LoginViewModel {
    
    // MARK: - Properties
    
    let availableRows: [LoginCellType] = [.username, .password, .loginButton]
    
    // MARK: - Methods
    
    func title() -> String {
        return "Login"
    }
    
    func titleForCellType(cellType: LoginCellType) -> String {
        switch cellType {
        case .username:
            return "Username"
        case .password:
            return "Password"
        case .loginButton:
            return "Log in"
        }
    }
    
    func placeholderForCellType(cellType: LoginCellType) -> String {
        switch cellType {
        case .username:
            return "Enter your username"
        case .password:
            return "Enter your password"
        default:
            return ""
        }
    }
    
    func secureTextInput(cellType: LoginCellType) -> Bool {
        switch cellType {
        case .password:
            return true
        default:
            return false
        }
    }
    
    func numberOfRows() -> Int {
        return self.availableRows.count
    }
    
}
