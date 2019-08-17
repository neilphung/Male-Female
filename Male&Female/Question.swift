//
//  Question.swift
//  Male&Female
//
//  Created by NeilPhung on 8/16/19.
//  Copyright © 2019 NeilPhung. All rights reserved.
//

import Foundation

struct Question {
    
    let questionImage : String
    let answer : Bool
    
    init(questionImage: String, correcAnswer: Bool) {
        self.questionImage = questionImage
        self.answer = correcAnswer
    }
}
