//
//  SleepDiaryCell.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 05/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

// MARK: - SleepDiaryCellViewModel

class SleepDiaryCellViewModel {
    
    let titleString: String
    let accessoryString: String?
    let cellType: SleepDiaryCellType
    
    init(titleString: String, accessoryString: String?, cellType: SleepDiaryCellType) {
        self.titleString = titleString
        self.accessoryString = accessoryString
        self.cellType = cellType
    }
    
}

// MARK: - SleepDiaryCell

class SleepDiaryCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accessoryLabel: UILabel!
    
    typealias SelectedValueHandler = (_ value: String?) -> Void
    
    var selectedValueHandler: SelectedValueHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupCell(titleString: String, accessoryString: String?) {
        self.titleLabel.text = titleString
        self.accessoryLabel.text = accessoryString
    }
    
    func setupCell(viewModel: SleepDiaryCellViewModel) {
        self.setupCell(titleString: viewModel.titleString, accessoryString: viewModel.accessoryString)
    }
    
}
