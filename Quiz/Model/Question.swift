//
//  Question.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-03.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation

class Question {
    fileprivate var _question: String!
    fileprivate var _answer1: String!
    fileprivate var _answer2: String!
    fileprivate var _answer3: String!
    fileprivate var _answer4: String!
    
    var question:String {
        return _question
    }
    var answer1:String {
        return _answer1
    }
    var answer2:String {
        return _answer2
    }
    var answer3:String {
        return _answer3
    }
    var answer4:String {
        return _answer4
    }
    
    init(question: String, answer1: String, answer2: String, answer3: String, answer4: String) {
        self._question = question
        self._answer1 = answer1
        self._answer2 = answer2
        self._answer3 = answer3
        self._answer4 = answer4
    }
    
    init(question: QuestionStruct) {
        self._question = question.question
        self._answer1 = question.answer1
        self._answer2 = question.answer2
        self._answer3 = question.answer3
        self._answer4 = question.answer4
    }
}

struct QuestionStruct {
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
}

var questionsStored: [QuestionStruct] {
    let question1 = QuestionStruct(question: "Who is the current president of America", answer1: "Barack Obama", answer2: "Hillary Clinton", answer3: "Donald Trump", answer4: "Vladimir Putin")
    return [question1]
}
