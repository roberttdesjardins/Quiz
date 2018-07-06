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
    fileprivate var _correctAnswer: String!
    
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
    var correctAnswer:String{
        return _correctAnswer
    }
    
    init(question: String, answer1: String, answer2: String, answer3: String, answer4: String, correctAnswer:String) {
        self._question = question
        self._answer1 = answer1
        self._answer2 = answer2
        self._answer3 = answer3
        self._answer4 = answer4
        self._correctAnswer = correctAnswer
    }
    
    init(question: QuestionStruct) {
        self._question = question.question
        self._answer1 = question.answer1
        self._answer2 = question.answer2
        self._answer3 = question.answer3
        self._answer4 = question.answer4
        self._correctAnswer = question.correctAnswer
    }
}

struct QuestionStruct {
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    let correctAnswer: String
}

var allQuestionsStored: [QuestionStruct] {
    let allQuestions = usPoliticalQuestionsStored + musicQuestionsStored
    return allQuestions
}

var usPoliticalQuestionsStored: [QuestionStruct] {
    let question0 = QuestionStruct(question: "Who is the current president of the United States?", answer1: "Barack Obama", answer2: "Hillary Clinton", answer3: "Donald Trump", answer4: "Vladimir Putin", correctAnswer: "Donald Trump")
    let question1 = QuestionStruct(question: "Name the first President of the United States", answer1: "Abraham Lincoln", answer2: "George Washington", answer3: "George H. W. Bush", answer4: "Channing Tatum", correctAnswer: "George Washington")
    let question2 = QuestionStruct(question: "In which year was the US Constitution drafted?", answer1: "1776", answer2: "1787", answer3: "1899", answer4: "2001", correctAnswer: "1787")
    let question3 = QuestionStruct(question: "Who is the longest serving president of the United States?", answer1: "George Washington", answer2: "Donald Trump", answer3: "Thomas Jefferson", answer4: "Franklin D. Roosevelt", correctAnswer: "Franklin D. Roosevelt")
    return [question0, question1, question2, question3]
}

var musicQuestionsStored: [QuestionStruct] {
    let question0 = QuestionStruct(question: "Which 80s Clash song, when re-released in 1991, went straight to number one in the UK?", answer1: "London Calling", answer2: "Straight to Hell", answer3: "Rock the Casbah", answer4: "Should I Stay or Should I Go?", correctAnswer: "Should I Stay or Should I Go?")
    let question1 = QuestionStruct(question: "Which of the following beatles albums was released first?", answer1: "Please Please Me", answer2: "Let It Be", answer3: "Sgt. Pepper's Lonely Hearts Club Band", answer4: "Introducing... The Beatles", correctAnswer: "Please Please Me")
    return [question0, question1]
}
