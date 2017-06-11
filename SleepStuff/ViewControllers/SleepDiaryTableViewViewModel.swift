//
//  SleepDiaryTableViewViewModel.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 05/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import Foundation

enum SleepDiaryCellType {
    case whatTimeInBed,
    whatTimeFellAsleep,
    howLongTillFellAsleep,
    howManyTimesWokeUp,
    whatTimeWokeUp,
    whatTimeOutOfBed,
    sleepQuality
}

class SleepDiaryTableViewViewModel {
    
    var whatTimeInBedSelectedValue: String?
    var whatTimeFellAsleepSelectedValue: String?
    var howLongTillFellAsleepSelectedValue: String?
    var howManyTimesWokeUpSelectedValue: String?
    var whatTimeWokeUpSelectedValue: String?
    var whatTimeOutOfBedSelectedValue: String?
    var sleepQualitySelectedValue: String?
    
    // MARK: - Properties
    
    var availableRows = [SleepDiaryCellViewModel]()
    
    // MARK: - Init
    
    init() {
        self.prepareScreen()
    }
    
    // MARK: - Methods
    
    func prepareScreen() {
        self.availableRows = [SleepDiaryCellViewModel]()
        
        self.availableRows.append(SleepDiaryCellViewModel(titleString: SleepDiaryQuestionData.whatTimeInBed.rawValue, accessoryString: whatTimeInBedSelectedValue, cellType: .whatTimeInBed))
        self.availableRows.append(SleepDiaryCellViewModel(titleString: SleepDiaryQuestionData.whatTimeFellAsleep.rawValue, accessoryString: whatTimeFellAsleepSelectedValue, cellType: .whatTimeFellAsleep))
        self.availableRows.append(SleepDiaryCellViewModel(titleString: SleepDiaryQuestionData.howLongTillFellAsleep.rawValue, accessoryString: howLongTillFellAsleepSelectedValue, cellType: .howLongTillFellAsleep))
        self.availableRows.append(SleepDiaryCellViewModel(titleString: SleepDiaryQuestionData.howManyTimesWokeUp.rawValue, accessoryString: howManyTimesWokeUpSelectedValue, cellType: .howManyTimesWokeUp))
        self.availableRows.append(SleepDiaryCellViewModel(titleString: SleepDiaryQuestionData.whatTimeWokeUp.rawValue, accessoryString: whatTimeWokeUpSelectedValue, cellType: .whatTimeWokeUp))
        self.availableRows.append(SleepDiaryCellViewModel(titleString: SleepDiaryQuestionData.whatTimeOutOfBed.rawValue, accessoryString: whatTimeOutOfBedSelectedValue, cellType: .whatTimeOutOfBed))
        self.availableRows.append(SleepDiaryCellViewModel(titleString: SleepDiaryQuestionData.sleepQuality.rawValue, accessoryString: sleepQualitySelectedValue, cellType: SleepDiaryCellType.sleepQuality))
    }
    
    func numberOfRows() -> Int {
        return self.availableRows.count
    }
    
}
