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
    
    var questionType: String {
        set { _questionType = newValue }
        get { return _questionType }
    }
    
    var questionChoices: [String] {
        set { _questionChoices = newValue }
        get { return _questionChoices }
    }
    
    init(questionType: String, questionChoices: [String]) {
        self._questionType = questionType
        self._questionChoices = questionChoices
    }
}
