//
//  Model.swift
//  TaskGame
//
//  Created by Nilu Technologies 1 on 18/11/21.
//

import Foundation
class QuestionList {
    var list = [Quesiton]()
    init(){
    list.append(Quesiton(questiontitle: "Q.1 Name of the first university of India?", answer: ["Nalanda University","Taxshila University","Jawahar University","Dronacharya Universit"], correctAnswerIndex: 1))
    list.append(Quesiton(questiontitle: "Q.1 Who is the Currrent PM of India?...", answer: ["Amit Shah","Narendra Modi","Vijay Rupani","Yogi Aadhityanath"], correctAnswerIndex: 2))
    list.append(Quesiton(questiontitle: "Q.3 Name of First Indian who reached south pole?", answer: ["Col. I K Bajaj","R.N. Shukla","V.R. Gill","D.B. Mahawar"], correctAnswerIndex: 1))
    list.append(Quesiton(questiontitle: "Q.4 Name of the first Indian woman ruler ?", answer: ["R.N. Shukla","V.R. Gill","D.B. Mahawar","Khan Abdul Gaffar Khan"], correctAnswerIndex: 4))
    list.append(Quesiton(questiontitle: "Q.5 Name of first foreign recipient of Bharat Ratna?", answer: ["Saira Begum","Laxmi Bai","Razia Sultan on Delhi's thronel","indira gandhi"], correctAnswerIndex: 3))
    }
}

