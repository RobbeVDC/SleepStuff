//
//  SleepDiaryDataSource.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 05/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import Foundation
import UIKit

protocol SleepDiaryDataSourceDelegate: class {
    func didSelect(cellType: SleepDiaryCellType, originalValue: String?)
}

class SleepDiaryDataSource: NSObject {
    
    weak var delegate: SleepDiaryDataSourceDelegate?
    
    fileprivate let tableView: UITableView
    fileprivate let tableViewViewModel: SleepDiaryTableViewViewModel
    fileprivate let defaultRowHeight: CGFloat = 60
    
    init(tableView: UITableView, tableViewViewModel: SleepDiaryTableViewViewModel, viewController: SleepDiaryViewController) {
        self.tableView = tableView
        self.tableViewViewModel = tableViewViewModel
        
        super.init()
        
        viewController.selectionDelegate = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: String(describing: SleepDiaryCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SleepDiaryCell.self))
    }
    
}

// MARK: - UITableViewDataSource

extension SleepDiaryDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SleepDiaryCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SleepDiaryCell.self), for: indexPath)
        cell.setupCell(viewModel: self.tableViewViewModel.availableRows[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension SleepDiaryDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = self.tableViewViewModel.availableRows[indexPath.row]
        self.delegate?.didSelect(cellType: cellViewModel.cellType, originalValue: cellViewModel.accessoryString)
    }
    
}

// MARK: - SleepDiarySelectionDelegate

extension SleepDiaryDataSource: SleepDiarySelectionDelegate {
    func selectValue(value: String, question: SleepDiaryQuestionData) {
        switch question {
        case .whatTimeInBed:
            self.tableViewViewModel.whatTimeInBedSelectedValue = value
        case .whatTimeFellAsleep:
            self.tableViewViewModel.whatTimeFellAsleepSelectedValue = value
        case .howLongTillFellAsleep:
            self.tableViewViewModel.howLongTillFellAsleepSelectedValue = value
        case .howManyTimesWokeUp:
            self.tableViewViewModel.howManyTimesWokeUpSelectedValue = value
        case .whatTimeWokeUp:
            self.tableViewViewModel.whatTimeWokeUpSelectedValue = value
        case .whatTimeOutOfBed:
            self.tableViewViewModel.whatTimeOutOfBedSelectedValue = value
        case .sleepQuality:
            self.tableViewViewModel.sleepQualitySelectedValue = value
        }
        
        self.tableViewViewModel.prepareScreen()
        self.tableView.reloadData()
    }
    
}
