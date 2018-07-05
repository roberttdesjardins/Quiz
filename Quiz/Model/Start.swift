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
    
    var questionType: String {
        return _questionType
    }
    
    init(questionType: String) {
        self._questionType = questionType
    }
}
