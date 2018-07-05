//
//  UserDefaultsExt.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-04.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation

extension UserDefaults{
    func setUserHighScores(array: [Int]){
        set(array, forKey: UserDefaultsKeys.userHighScores.rawValue)
    }
    
    func getUserHighScores() -> [Int]{
        return object(forKey: UserDefaultsKeys.userHighScores.rawValue) as? [Int] ?? [Int]()
    }
}


enum UserDefaultsKeys : String {
    case userHighScores
    case userCredits
}
