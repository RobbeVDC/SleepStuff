//
//  SleepDiaryAnswerData.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 10/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import Foundation

struct SleepDiaryAnswerData {
    
    enum QualityRating: Int {
        case veryBad = 1,
        bad = 2,
        average = 3,
        good = 4,
        veryGood = 5
        
        func getRatingTitle() -> String {
            switch self {
            case .veryBad:
                return "1: Zeer slecht"
            case .bad:
                return "2: Slecht"
            case .average:
                return "3: Gemiddeld"
            case .good:
                return "4: Goed"
            case .veryGood:
                return "5: Zeer goed"
            }
        }
    }
    
    static let allAnswers = [QualityRating.veryBad.getRatingTitle(), QualityRating.bad.getRatingTitle(), QualityRating.average.getRatingTitle(), QualityRating.good.getRatingTitle(), QualityRating.veryGood.getRatingTitle()]
    
    static func getAnswers(forQuestion: SleepDiaryQuestionData) -> [Any] {
        return SleepDiaryAnswerData.allAnswers
    }
}
