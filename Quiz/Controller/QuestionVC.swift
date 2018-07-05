//
//  QuestionVC.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-03.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answer1Btn: UIButton!
    @IBOutlet weak var answer2Btn: UIButton!
    @IBOutlet weak var answer3Btn: UIButton!
    @IBOutlet weak var answer4Btn: UIButton!
    @IBOutlet weak var timeRemainingLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    
    var answer = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer1Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        answer2Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        answer3Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        answer4Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        getQuestion()
    }
    
    func getQuestion() {
        let randomQuestion = randRange(lower: 0, upper: UInt32(allQuestionsStored.count - 1))
        let question = Question(question: allQuestionsStored[randomQuestion])
        questionLbl.text = question.question
        answer1Btn.setTitle(question.answer1, for: .normal)
        answer2Btn.setTitle(question.answer2, for: .normal)
        answer3Btn.setTitle(question.answer3, for: .normal)
        answer4Btn.setTitle(question.answer4, for: .normal)
        answer = question.correctAnswer
    }
    
    @IBAction func answer1BtnPressed(_ sender: Any) {
        if answer1Btn.currentTitle == answer { answeredCorrectly() }
        else { answeredIncorrectly() }
    }
    @IBAction func answer2BtnPressed(_ sender: Any) {
        if answer2Btn.currentTitle == answer { answeredCorrectly() }
        else { answeredIncorrectly() }
    }
    @IBAction func answer3BtnPressed(_ sender: Any) {
        if answer3Btn.currentTitle == answer { answeredCorrectly() }
        else { answeredIncorrectly() }
    }
    @IBAction func answer4BtnPressed(_ sender: Any) {
        if answer4Btn.currentTitle == answer { answeredCorrectly() }
        else { answeredIncorrectly() }
    }
    
    
    func answeredCorrectly() {
        // TODO
        print("Answered Correctly!")
        getQuestion()
    }
    
    func answeredIncorrectly() {
        // TODO
        print("wrong")
        getQuestion()
    }
    
    @IBAction func exitBtnPressed(_ sender: Any) {
        // TODO: Save score?
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func randRange (lower: UInt32 , upper: UInt32) -> Int {
        return Int(lower + arc4random_uniform(upper - lower + 1))
    }
}
