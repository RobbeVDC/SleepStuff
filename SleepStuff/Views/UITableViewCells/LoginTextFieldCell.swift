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
        self.loadView()
    }
    
    private func loadView() {
        self.contentTextField.layer.borderWidth = 0.5
        self.contentTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setupCell(labelTitle: String, textfieldPlaceholder: String) {
        self.titleLabel.text = labelTitle
        self.contentTextField.placeholder = textfieldPlaceholder
        self.selectionStyle = .none
    }
    
}
