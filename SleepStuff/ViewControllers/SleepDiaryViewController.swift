//
//  SleepDiaryViewController.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 05/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit
import CoreActionSheetPicker

protocol SleepDiaryViewControllerDelegate: class {
    func didTapSave(viewController: SleepDiaryViewController)
}

protocol SleepDiarySelectionDelegate: class {
    func selectValue(value: String, question: SleepDiaryQuestionData)
}

class SleepDiaryViewController: BaseViewController {
    
    weak var delegate: SleepDiaryViewControllerDelegate?
    weak var selectionDelegate: SleepDiarySelectionDelegate?
    
    private let viewModel: SleepDiaryViewModel
    private var dataSource: SleepDiaryDataSource?
    private var tableView = UITableView(frame: .zero, style: .grouped)
    
    required init(viewModel: SleepDiaryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupTitle() {
        self.title = self.viewModel.title()
    }
    
    override func setupLoadView() {
        self.view.addSubview(tableView)
        
        let dataSource = SleepDiaryDataSource(tableView: self.tableView, tableViewViewModel: self.viewModel.tableViewViewModel, viewController: self)
        self.tableView.dataSource = dataSource
        dataSource.delegate = self
        self.dataSource = dataSource
    }
    
    override func setupConstraints() {
        self.tableView.autoPinEdgesToSuperviewEdges()
    }
    
}

extension SleepDiaryViewController: SleepDiaryDataSourceDelegate {
    
    func didSelect(cellType: SleepDiaryCellType, originalValue: String?) {
        var question: SleepDiaryQuestionData
        
        switch cellType {
        case .whatTimeInBed:
            question = SleepDiaryQuestionData.whatTimeInBed
        case .whatTimeFellAsleep:
            question = SleepDiaryQuestionData.whatTimeFellAsleep
        case .howLongTillFellAsleep:
            question = SleepDiaryQuestionData.howLongTillFellAsleep
        case .howManyTimesWokeUp:
            question = SleepDiaryQuestionData.howManyTimesWokeUp
        case .whatTimeWokeUp:
            question = SleepDiaryQuestionData.whatTimeWokeUp
        case .whatTimeOutOfBed:
            question = SleepDiaryQuestionData.whatTimeOutOfBed
        }
        
        self.presentTimeActionSheet(question: question)
//        self.presentActionSheet(question: question)
    }
    
    private func presentTimeActionSheet(question: SleepDiaryQuestionData) {
        ActionSheetDatePicker.show(withTitle: question.rawValue,
                                   datePickerMode: .time,
                                   selectedDate: Date(),
                                   doneBlock: { [weak self] (_, date, _) in
                                    guard let `self` = self else { print("self gone in File: \(#file) on Line: \(#line) in Function: \(#function)"); return }
                                    
                                    if let date = date as? Date {
                                        self.selectionDelegate?.selectValue(value: date.formattedHour, question: question)
                                    }
            }, cancel: { ActionStringCancelBlock in return }, origin: self.view)
    }
    
    private func presentActionSheet(question: SleepDiaryQuestionData) {
        ActionSheetStringPicker.show(withTitle: question.rawValue,
                                     rows: SleepDiaryAnswerData.getAnswers(forQuestion: question),
                                     initialSelection: 1,
                                     doneBlock: { [weak self] picker, index, value in
                                        guard let `self` = self else { print("self gone in File: \(#file) on Line: \(#line) in Function: \(#function)"); return }
                                        
                                        if let value = value as? String {
                                            self.selectionDelegate?.selectValue(value: value, question: question)
                                        }
        }, cancel: { ActionStringCancelBlock in return }, origin: self.view)
    }
    
}
