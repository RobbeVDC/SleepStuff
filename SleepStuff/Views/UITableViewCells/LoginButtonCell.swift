//
//  LoginButtonCell.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 04/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

class LoginButtonCell: UITableViewCell {

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            self.loginButton.layer.cornerRadius = 10
            self.loginButton.backgroundColor = .blue
            self.loginButton.setTitleColor(.white, for: .normal)
        }
    }
    
    var tapAction: ((UITableViewCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(buttonTitle: String) {
        self.loginButton.setTitle(buttonTitle, for: .normal)
        self.selectionStyle = .none
    }
    
    @IBAction func buttonTap(sender: AnyObject) {
        self.tapAction?(self)
    }
    
}
