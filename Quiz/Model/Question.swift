//
//  Question.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-03.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation

class Question {
    fileprivate var _category: String!
    fileprivate var _type: String!
    fileprivate var _difficulty: String!
    fileprivate var _question: String!
    fileprivate var _correctAnswer: String!
    fileprivate var _incorrectAnswers: [String]
    
    var category:String {
        return _category
    }
    var type: String {
        return _type
    }
    var difficulty:String {
        return _difficulty
    }
    var question:String {
        return _question
    }
    var correctAnswer:String{
        return _correctAnswer
    }
    var incorrectAnswer:[String]{
        return _incorrectAnswers
    }
    
    init(category: String, type: String, difficulty: String, question: String, correctAnswer:String, incorrectAnswers:[String]) {
        self._category = category
        self._type = type
        self._difficulty = difficulty
        self._question = question
        self._correctAnswer = correctAnswer
        self._incorrectAnswers = incorrectAnswers
    }
    
    init(question: QuestionStruct) {
        self._category = question.category
        self._type = question.type
        self._difficulty = question.difficulty
        self._question = question.question
        self._correctAnswer = question.correctAnswer
        self._incorrectAnswers = question.incorrectAnswers
    }
    
    init?(json: Dictionary<String, Any>) {
        guard let category = json["category"] as? String,
            let type = json["type"] as? String,
            let difficulty = json["difficulty"] as? String,
            let question = json["question"] as? String,
            let correctAnswer = json["correct_answer"] as? String,
            let incorrectAnswers = json["incorrect_answers"] as? [String]
        else {
                return nil
        }
        self._category = category
        self._type = type
        self._difficulty = difficulty
        self._question = question
        self._correctAnswer = correctAnswer
        self._incorrectAnswers = incorrectAnswers
    }
}

struct QuestionStruct {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}

enum Category : String {
    case USPolitics = "US Politics"
    case Music = "Music"
}

enum Difficulty : String {
    case Easy = "easy"
    case Medium = "medium"
    case Hard = "hard"
}

//var allQuestionsStored: [QuestionStruct] {
//    let allQuestions = usPoliticalQuestionsStored
//    return allQuestions
//}

//var usPoliticalQuestionsStored: [QuestionStruct] {
//    let question0 = QuestionStruct(category: Category.USPolitics.rawValue, question: "Who is the current president of the United States?", difficulty: Difficulty.Easy.rawValue, correctAnswer: "Donald Trump", incorrectAnswers: ["Barack Obama", "Hillary Clinton", "Vladimir Putin"])
//    let question1 = QuestionStruct(category: Category.USPolitics.rawValue, question: "Name the first President of the United States", difficulty: Difficulty.Easy.rawValue, correctAnswer: "George Washington", incorrectAnswers: ["Abraham Lincoln", "George H. W. Bush", "Channing Tatum"])
//    let question2 = QuestionStruct(category: Category.USPolitics.rawValue, question: "In which year was the US Constitution drafted?", difficulty: Difficulty.Medium.rawValue, correctAnswer: "1787", incorrectAnswers: ["1776", "1899", "2001"])
//    let question3 = QuestionStruct(category: Category.USPolitics.rawValue, question: "Who is the longest serving president of the United States?", difficulty: Difficulty.Easy.rawValue, correctAnswer: "Franklin D. Roosevelt", incorrectAnswers: ["Donald Trump", "Thomas Jefferson", "George Washington"])
//    let question4 = QuestionStruct(category: Category.USPolitics.rawValue, question: "In what year was the US Constitution last amended?", difficulty: Difficulty.Hard.rawValue, correctAnswer: "1992", incorrectAnswers: ["1789", "1945", "2001"])
//    let question5 = QuestionStruct(category: Category.USPolitics.rawValue, question: "How many voting memebers are there in the United States Congress?", difficulty: Difficulty.Medium.rawValue, correctAnswer: "535", incorrectAnswers: ["100", "538", "675"])
//    let question6 = QuestionStruct(category: Category.USPolitics.rawValue, question: "How many US presidents have been assassinated?", difficulty: Difficulty.Easy.rawValue, correctAnswer: "4", incorrectAnswers: ["1", "2", "3"])
//    return [question0, question1, question2, question3, question4, question5, question6]
//}

//var musicQuestionsStored: [QuestionStruct] {
//    let question0 = QuestionStruct(question: "Which 80s Clash song, when re-released in 1991, went straight to number one in the UK?", answer1: "London Calling", answer2: "Straight to Hell", answer3: "Rock the Casbah", answer4: "Should I Stay or Should I Go?", correctAnswer: "Should I Stay or Should I Go?")
//    let question1 = QuestionStruct(question: "Which of the following beatles albums was released first?", answer1: "Please Please Me", answer2: "Let It Be", answer3: "Sgt. Pepper's Lonely Hearts Club Band", answer4: "Introducing... The Beatles", correctAnswer: "Please Please Me")
//    let question2 = QuestionStruct(question: "Fill in the song lyrics: 'London calling to the ____ of death; Quit holdin' out and draw another breath'", answer1: "Zombies", answer2: "Choir", answer3: "City", answer4: "Underworld", correctAnswer: "Zombies")
//    let question3 = QuestionStruct(question: "Fill in the song lyrics: 'Two plus two is four; Minus one that's three, ____ maths'", answer1: "easy", answer2: "fast", answer3: "basic", answer4: "quick", correctAnswer: "quick")
//    let question4 = QuestionStruct(question: "What is the phone number for Jenny in the famous song by Tommy Tutone?", answer1: "867-5309", answer2: "776-2323", answer3: "273-8255", answer4: "420-6969", correctAnswer: "867-5309")
//
//    return [question0, question1, question2, question3, question4]
//}
