//
//  QuizOneDB.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/15/22.
//

import Foundation

class QuizOneDB {
  
    
    var id : Int
    var question: String?
    var answer: String?
    var wrong1: String?
    var wrong2: String?
    var wrong3: String?
    var wrong4: String?
   init(id: Int, question: String? = "", answer: String? = "", wrong1: String? = "", wrong2: String? = "", wrong3: String? = "", wrong4: String? = "") {
        self.id = id
        self.question = question
        self.answer = answer
        self.wrong1 = wrong1
        self.wrong2 = wrong2
        self.wrong3 = wrong3
        self.wrong4 = wrong4
    }
}
