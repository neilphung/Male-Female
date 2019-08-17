//
//  QuestionBank.swift
//  Male&Female
//
//  Created by NeilPhung on 8/16/19.
//  Copyright © 2019 NeilPhung. All rights reserved.
//

import Foundation


struct QuestionBank {
    var list = [Question]()
    
    init() {
        list.append(Question(questionImage: "canhcut", correcAnswer: true))
        list.append(Question(questionImage: "cao", correcAnswer: true))
        list.append(Question(questionImage: "cho", correcAnswer: true))
        list.append(Question(questionImage: "hama", correcAnswer: true))
        list.append(Question(questionImage: "lon", correcAnswer: true))
 
        
    }
}
