//
//  Start.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-04.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation

class Start {
    fileprivate var _questionType: String!
    fileprivate var _questionChoices: [String]!
    
    
    var questionChoices: [String] {
        return _questionChoices
    }
    
    var questionType: String {
        set { _questionType = newValue }
        get { return _questionType }
    }
    
    init(questionType: String, questionChoices: [String]) {
        self._questionType = questionType
        self._questionChoices = questionChoices
    }
}
