//
//  ViewController.swift
//  TaskGame
//
//  Created by Nilu Technologies 1 on 17/11/21.
//

import UIKit

//struct Quiz {
//    var question : String
//    var answer:[String]
//    var state : Int
//    }

class ViewController: UIViewController {
    var quiz = [QuestionList]()
    var buttonCounter = 6
    var correctAnswerIndex = 0
    @IBOutlet var lblQuestion: UILabel!
    @IBOutlet var lblQuestion1to5: UILabel!
    @IBOutlet var imgQuestionMark: UIImageView!
    @IBOutlet var QuestionViewCenter: UIView!
    @IBOutlet var ViewTop: GradientView!
    @IBOutlet var BtnOption1: UIButton!
    @IBOutlet var BtnOption2: UIButton!
    @IBOutlet var BtnOption3: UIButton!
    @IBOutlet var BtnOption4: UIButton!
    @IBOutlet var BtnNextQuestion: UIButton!
    
    @IBOutlet var lblCorrectInCorrect: UILabel!
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonUI()
        BtnNext(BtnNextQuestion)
    }
    
    func ButtonUI(){
        QuestionViewCenter.layer.cornerRadius = 20
        QuestionViewCenter.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45).cgColor
        QuestionViewCenter.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        QuestionViewCenter.layer.shadowOpacity = 1.0
        QuestionViewCenter.layer.shadowRadius = 4
        BtnOption1.layer.cornerRadius = 15
        BtnOption1.layer.borderWidth = 1
        BtnOption1.layer.borderColor = UIColor.lightGray.cgColor
        BtnOption2.layer.cornerRadius = 15
        BtnOption2.layer.borderWidth = 1
        BtnOption2.layer.borderColor = UIColor.lightGray.cgColor
        BtnOption3.layer.cornerRadius = 15
        BtnOption3.layer.borderWidth = 1
        BtnOption3.layer.borderColor = UIColor.lightGray.cgColor
        BtnOption4.layer.cornerRadius = 15
        BtnOption4.layer.borderWidth = 1
        BtnOption4.layer.borderColor = UIColor.lightGray.cgColor
        BtnNextQuestion.layer.cornerRadius = 15
        BtnOption1.showsTouchWhenHighlighted = true
        imgQuestionMark.layer.cornerRadius = 35
        
    }
    @IBAction func btnAnswercheck(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:
            BtnOption1.layer.borderWidth = 2
            BtnOption1.layer.borderColor = UIColor.blue.cgColor
        case 2:
            BtnOption2.layer.borderWidth = 2
            BtnOption2.layer.borderColor = UIColor.blue.cgColor
        case 3:
            BtnOption3.layer.borderWidth = 2
            BtnOption3.layer.borderColor = UIColor.blue.cgColor
        case 4:
            BtnOption4.layer.borderWidth = 2
            BtnOption4.layer.borderColor = UIColor.blue.cgColor
        default:
            print("")
        }
        if correctAnswerIndex == 0{
            BtnOption1.layer.borderWidth = 2
            BtnOption1.layer.borderColor = UIColor.green.cgColor
        }
        else if correctAnswerIndex == 1{
            BtnOption2.layer.borderWidth = 2
            BtnOption2.layer.borderColor = UIColor.green.cgColor
        }
        else if correctAnswerIndex == 2{
            BtnOption3.layer.borderWidth = 2
            BtnOption3.layer.borderColor = UIColor.green.cgColor
        }
        else if correctAnswerIndex == 3{
           // BtnOption4.layer.borderWidth = 2
            BtnOption4.layer.borderColor = UIColor.green.cgColor
        }
        

    }
    @IBAction func BtnNext(_ sender: UIButton) {
        buttonCounter -= 1
        switch (buttonCounter) {
        case 1:
            lblQuestion.text = "1 Who is the Currrent PM of India?..."
            BtnOption1.setTitle("Amit Shah", for: .normal)
            BtnOption2.setTitle("Narendra Modi" , for: .normal)
            BtnOption3.setTitle("Vijay Rupani", for: .normal)
            BtnOption4.setTitle("Yogi Aadhityanath", for: .normal)
            correctAnswerIndex = 1
            
            break;
            
        case 2:
            if buttonCounter >= 1{
                BtnOption1.layer.borderColor = UIColor.clear.cgColor
                BtnOption1.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption2.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption3.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption4.layer.borderColor =  UIColor.lightGray.cgColor
            }
            lblQuestion.text = "2 Name of the first university of India?..."
            BtnOption1.setTitle("Dronacharya University", for: .normal)
            BtnOption2.setTitle("Nalanda University" , for: .normal)
            BtnOption3.setTitle("Jawahar University", for: .normal)
            BtnOption4.setTitle("Taxshila University", for: .normal)
            correctAnswerIndex = 1
            break;
        case 3:
            if buttonCounter >= 2{
                BtnOption1.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption2.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption3.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption4.layer.borderColor =  UIColor.lightGray.cgColor            }
            lblQuestion.text = "3 Name of First Indian who reached south pole?."
            BtnOption1.setTitle("Col. I K Bajaj", for: .normal)
            BtnOption2.setTitle("R.N. Shukla" , for: .normal)
            BtnOption3.setTitle("V.R. Gill", for: .normal)
            BtnOption4.setTitle("D.B. Mahawar", for: .normal)
            correctAnswerIndex = 0
            break;
        case 4:
            if buttonCounter >= 3{
                BtnOption1.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption2.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption3.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption4.layer.borderColor =  UIColor.lightGray.cgColor
            }
            lblQuestion.text = "4 Name of the first Indian woman ruler ?"
            BtnOption1.setTitle("Saira Begum", for: .normal)
            BtnOption2.setTitle("Laxmi Bai" , for: .normal)
            BtnOption3.setTitle("Razia Sultan on Delhi's thronel", for: .normal)
            BtnOption4.setTitle("indira gandhi", for: .normal)
            correctAnswerIndex =  2
            break;
        case 5:
            if buttonCounter >= 4{
                BtnOption1.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption2.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption3.layer.borderColor =  UIColor.lightGray.cgColor
                BtnOption4.layer.borderColor =  UIColor.lightGray.cgColor
            }
            lblQuestion.text = "5 Name of first foreign recipient of Bharat Ratna?"
            BtnOption1.setTitle("R.N. Shukla", for: .normal)
            BtnOption2.setTitle("V.R. Gill" , for: .normal)
            BtnOption3.setTitle("D.B. Mahawar", for: .normal)
            BtnOption4.setTitle("Khan Abdul Gaffar Khan", for: .normal)
            correctAnswerIndex =  3
            break;
            
      
            
        default:
        print("nothing")
        }
        
    }
}

