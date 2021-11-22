//
//  Question.swift
//  TaskGame
//
//  Created by Nilu Technologies 1 on 18/11/21.
//

import Foundation
class Quesiton {
    let questiontitle : String
    let answer : [String]
    let correctAnswerIndex : Int
    
    init(questiontitle:String,answer:[String],correctAnswerIndex : Int) {
        self.questiontitle = questiontitle
        self.answer = answer
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    func ValidateAnswer(to GiveAnswer : String) -> Bool{
        return (GiveAnswer == answer[correctAnswerIndex])
    }
    func getQuestionTitle() -> String{
        return questiontitle
    }
    func getchioce() -> [String] {
        return answer
    }
    func getAnswer(index : Int) -> String {
        return answer[index]
    }
    
}
