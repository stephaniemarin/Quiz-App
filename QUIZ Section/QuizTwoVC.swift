//
//  QuizTwoVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/16/22.
//

import UIKit
import SQLite3

struct QDB {
    var answer: Bool
    var question: String
    var comment: String
}



class QuizTwoVC: UIViewController {
    var quizTwoQuestions = [QDB]()
    var db : OpaquePointer?
    var answers = [Bool]()
    var numberQuestions = 27
    var numCorrect = 0
    var attemptedQuestions = 0
    var currentQuestion = 0
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var TrueBtn: UIButton!
    @IBOutlet weak var FalseBtn: UIButton!
    @IBOutlet weak var ContinueBtn: UIButton!
   

    override func viewDidLoad() {
       super.viewDidLoad()
        
        image.image = UIImage(named:"test1")
        
       if let fileURL = Bundle.main.url(forResource: "PictureTrueFalseDB", withExtension: "db") {
           
           print("Found file!!!")
           
       
        
        
           if sqlite3_open(fileURL.path,&db) != SQLITE_OK {
               print("Sobbing crocodile tears.")
               return
           }
           else {
               print ("Found database!!!")
           }
       }
        else {
            print("oh no what is wrong dearie")
            return
        }//end of opening file with url.
          
           let query = "select * from questions"
           var stmt : OpaquePointer?
        var carrot : [String] = []  // is question true or false
        var stick : [String] = []  // question image name
        var correct : [Bool] = []  // comment
           if sqlite3_prepare(db,query,-2,&stmt,nil) != SQLITE_OK {
               let err = String(cString: sqlite3_errmsg(db))
               print("oh error  \(err)")
               return
           }
           while (sqlite3_step(stmt) == SQLITE_ROW) {
            
               let id = sqlite3_column_int(stmt,0)
               let q = String(cString:sqlite3_column_text(stmt,1))
               let c = String(cString:sqlite3_column_text(stmt,2))

               carrot.append(q)
               stick.append(c)
               
           }
              
               for _ in 0...16 { correct.append(true)}
               for _ in 17...26 {correct.append(false)}
               var order : [Int] = []
               for i in 0...26 { order.append(i)}
               order.shuffle()
               for i in order {
                   let token = QDB(answer: correct[i],question:carrot[i],comment: stick[i])

                   quizTwoQuestions.append(token)
                   
               }
               print()
               for x in 0..<numberQuestions {
                   let y = quizTwoQuestions[x]
                   
                   print(y.question)
                   print(y.answer)
                   print(y.comment)
                   print()
               }
    
        let nAmE = quizTwoQuestions[0].question
        image.image = UIImage(named: nAmE)
        
        
        
           }
    func checkAnswer(idQ: Bool) {
        let veracity = quizTwoQuestions[currentQuestion].answer
        if veracity {//veracity ==true
            
            if idQ == true {
                numCorrect += 1
               
                responseLabel.text="Correct! " + quizTwoQuestions[currentQuestion].comment
                TrueBtn.backgroundColor = .green
            }
            else {//wrong answer chose false
                responseLabel.text="InCorrect! " + quizTwoQuestions[currentQuestion].comment
                FalseBtn.backgroundColor = .red
            }
        }
        else
        {//veracity ==false
            if idQ == false {
                numCorrect += 1
                
                responseLabel.text="Correct! " + quizTwoQuestions[currentQuestion].comment
                FalseBtn.backgroundColor = .green

            }
            else {
                responseLabel.text="InCorrect! " + quizTwoQuestions[currentQuestion].comment
                TrueBtn.backgroundColor = .red
            }
           
        }
 
        }
       
    
    
   
    
    @IBAction func clickedTrue(_ sender: Any) {
       
        TrueBtn.isEnabled = false
        FalseBtn.isEnabled = false
        ContinueBtn.isEnabled = true
        checkAnswer(idQ: true)
        
    }
    
    @IBAction func clickedFalse(_ sender: Any) {
       
        TrueBtn.isEnabled = false
        FalseBtn.isEnabled = false
        ContinueBtn.isEnabled = true
        checkAnswer(idQ: false)
    }
    

    @IBAction func nextQuestion(_ sender: Any) {
        TrueBtn.isEnabled = true
        FalseBtn.isEnabled = true
        ContinueBtn.isEnabled = false
        TrueBtn.backgroundColor = .brown
        FalseBtn.backgroundColor = .brown
        responseLabel.text = ""
        currentQuestion += 1
        if currentQuestion == 27 {return}//to do functionality
        let nAmE = quizTwoQuestions[currentQuestion].question
        image.image = UIImage(named: nAmE)
    }
    
    
    

        
    
    
    
    


}


