//
//  GameData.swift
//  Quiz
//
//  Created by Robert Desjardins on 2018-07-06.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation

class GameData {
    static let shared = GameData()
    var startTimer = 10
    var maxNumberOfQuestionsWrong = 3
}
