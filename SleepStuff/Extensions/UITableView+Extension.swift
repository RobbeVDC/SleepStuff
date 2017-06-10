//
//  UITableView+Extension.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 05/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Generic method to dequeue UITableViewCell. Making sure that all force casts are isolated in this extension
    ///
    /// - Parameters:
    ///   - identifier: A string identifying the cell object to be reused.
    ///   - indexPath: The index path specifying the location of the cell.
    /// - Returns: A UITableviewCell instance of an expected type
    func dequeueReusableCell<T: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
    
    /// Generic method to dequeue UITableViewHeaderFooterView. Making sure that all force casts are isolated in this extension
    ///
    /// - Parameter identifier: A string identifying the header object to be reused.
    /// - Returns: A UITableViewHeaderFooterView instance of an expected type
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withIdentifier identifier: String) -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as! T
    }
    
}
