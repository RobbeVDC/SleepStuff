//
//  LoginTextFieldCell.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

class LoginTextFieldCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(labelTitle: String, textfieldPlaceholder: String, isSecure: Bool = false) {
        self.titleLabel.text = labelTitle
        self.contentTextField.placeholder = textfieldPlaceholder
        self.contentTextField.isSecureTextEntry = isSecure
        self.selectionStyle = .none
    }
    
}
