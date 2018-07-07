//
//  UserDefaultsExt.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-04.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation

extension UserDefaults{
    func setUserHighScore(score: Int){
        set(score, forKey: UserDefaultsKeys.userHighScores.rawValue)
    }
    
    func getUserHighScore() -> Int{
        return object(forKey: UserDefaultsKeys.userHighScores.rawValue) as? Int ?? Int()
    }
}


enum UserDefaultsKeys : String {
    case userHighScores
    case userCredits
}
