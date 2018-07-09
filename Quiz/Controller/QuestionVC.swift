//
//  QuestionVC.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-03.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    // TODO: Create a countdown timer
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answer1Btn: UIButton!
    @IBOutlet weak var answer2Btn: UIButton!
    @IBOutlet weak var answer3Btn: UIButton!
    @IBOutlet weak var answer4Btn: UIButton!
    @IBOutlet weak var timeRemainingLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    
    var answer = ""
    var score = 0
    var numberOfWrongAnswers: Int = 0
    let maxNumberOfWrongAnswers = GameData.shared.maxNumberOfQuestionsWrong
    
    var questionType: String?
    var listOfQuestions: [QuestionStruct]!
    
    var seconds = GameData.shared.startTimer
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLbl.text = "Score: \(score)"
        answer1Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        answer2Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        answer3Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        answer4Btn.titleLabel?.adjustsFontSizeToFitWidth = true
        setQuestionType()
        getQuestion()
        runTimer()
    }
    
    func setQuestionType() {
        if questionType != nil {
            switch questionType {
            case "All":
                listOfQuestions = allQuestionsStored
            case "US Politics":
                listOfQuestions = usPoliticalQuestionsStored
            case "Music":
                listOfQuestions = musicQuestionsStored
            default:
                listOfQuestions = allQuestionsStored
            }
        }
    }
    
    
    func getQuestion() {
        let randomQuestion = randRange(lower: 0, upper: UInt32(listOfQuestions.count - 1))
        let question = Question(question: listOfQuestions[randomQuestion])
        questionLbl.text = question.question
        answer1Btn.setTitle(question.answer1, for: .normal)
        answer2Btn.setTitle(question.answer2, for: .normal)
        answer3Btn.setTitle(question.answer3, for: .normal)
        answer4Btn.setTitle(question.answer4, for: .normal)
        answer = question.correctAnswer
        seconds = GameData.shared.startTimer
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
        score = score + (10 * seconds)
        scoreLbl.text = "Score: \(score)"
        getQuestion()
    }
    
    func answeredIncorrectly() {
        numberOfWrongAnswers = numberOfWrongAnswers + 1
        if numberOfWrongAnswers >= maxNumberOfWrongAnswers {
            gameOver()
        }
        getQuestion()
    }
    
    @IBAction func exitBtnPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you want to quit?", message: "Score will be recorded", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { _ in
            NSLog("The \"No\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            NSLog("The \"Yes\" alert occured.")
            self.gameOver()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func gameOver() {
        if score >= UserDefaults.standard.getUserHighScore() as Int {
            UserDefaults.standard.setUserHighScore(score: score)
        }
        
        let alert = UIAlertController(title: "Game Over", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            NSLog("The \"Ok\" alert occured.")
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(QuestionVC.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timeRemainingLbl.text = "Time Remaining: \(seconds)"
        if seconds <= 0 {
            answeredIncorrectly()
        }
    }
    
    func randRange (lower: UInt32 , upper: UInt32) -> Int {
        return Int(lower + arc4random_uniform(upper - lower + 1))
    }
}
