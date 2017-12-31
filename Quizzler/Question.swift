//
//  Question.swift
//  Quizzler
//
//  Created by Johan Lindstrom on 12/2/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    // Properties
    let questionText : String
    let answer : Bool
    let extraAnswer : String
    
    // Actions / Methods
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
        extraAnswer = "\(correctAnswer)"
    }
    
}
