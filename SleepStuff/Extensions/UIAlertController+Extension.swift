//
//  UIAlertController+Extension.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 13/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    /// Creates an alertcontroller with the pattern of "Your warning message" -> OK
    /// Yes executes a code block
    ///
    /// - Parameters:
    ///   - title: Optional customized title
    ///   - message: The warning message to be shown
    ///   - actions: UIAlertActions that will be shown first
    ///   - completion: Completion block executed when the user taps "OK"
    /// - Returns: A warning alertcontroller
    class func showOKAlert(withTitle title: String = "Opgelet", message: String, actions: [UIAlertAction] = [], completion: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            completion()
        }
        actions.forEach { alertController.addAction($0) }
        alertController.addAction(okButton)
        return alertController
    }
    
}
