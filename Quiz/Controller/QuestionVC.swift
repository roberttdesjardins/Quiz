//
//  QuestionVC.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-03.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    // TODO: Get working with api
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
    var jsonUrl: String = ""
    var jsonResult: [String:Any]?
    var listOfQuestions: [Question] = [] // A list of questions for this round
    
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
        parseJsonForQuestions()
        getQuestion()
        runTimer()
    }
    
    func parseJSON(){
        do {
            let data = NSData(contentsOf: NSURL(string: jsonUrl)! as URL)
            
            jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]

        } catch let error as NSError {
            print(error)
        }
    }
    
    func setQuestionType() {
        if questionType != nil {
            switch questionType {
            case "All":
                jsonUrl = "https://opentdb.com/api.php?amount=50"
            case "Politics":
                jsonUrl = "https://opentdb.com/api.php?amount=50&category=24"
            case "Music":
                jsonUrl = "https://opentdb.com/api.php?amount=50&category=12"
            default:
                jsonUrl = "https://opentdb.com/api.php?amount=50"
            }
        }
        parseJSON()
    }
    
    func parseJsonForQuestions() {
        // Goes through the given json file and adds all questions to listOfQuestions
        // TODO: Only adds multiple choice atm
        for question in jsonResult!["results"] as! [Dictionary<String, Any>] {
            if question["type"] as! String == "multiple" {
                let newQuestion = Question.init(json: question)
                listOfQuestions.append(newQuestion!)
            }
        }
    }
    
    
    func getQuestion() {
        let randomQuestion = randRange(lower: 0, upper: UInt32(listOfQuestions.count - 1))
        let question = listOfQuestions[randomQuestion]
        questionLbl.text = question.question

        var answersToShuffle = question.incorrectAnswer
        answersToShuffle.append(question.correctAnswer)
        let shuffledAnswers = shuffleArray(arrayToShuffle: answersToShuffle)

        answer1Btn.setTitle(shuffledAnswers[0], for: .normal)
        answer2Btn.setTitle(shuffledAnswers[1], for: .normal)
        answer3Btn.setTitle(shuffledAnswers[2], for: .normal)
        answer4Btn.setTitle(shuffledAnswers[3], for: .normal)
        answer = question.correctAnswer
        seconds = GameData.shared.startTimer
    }
    
    func shuffleArray(arrayToShuffle: [String]) -> [String] {
        var items = arrayToShuffle
        var last = items.count - 1
        
        while(last > 0)
        {
            let rand = Int(arc4random_uniform(UInt32(last)))
            items.swapAt(last, rand)
            last -= 1
        }
        return items
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
