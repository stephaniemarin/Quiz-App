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
    
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collision:UICollisionBehavior!
    var bouncy:UIDynamicItemBehavior!
   
    
    var ScoringCGRect :CGRect!
    var MainHeadlineCGRect :CGRect!
    var TrueBtnCGRect: CGRect!
    var FalseBtnCGRect:CGRect!
    
    var gravityForFalse : Bool = false
    
    @IBOutlet weak var MainHeadline: UILabel!
    var quizTwoQuestions = [QDB]()
    var Prodding = [String]()
    var db : OpaquePointer?
    var answers = [Bool]()
    @IBOutlet weak var Scoring: UILabel!
    var numberQuestions = 27
    var numCorrect = 0
    var attemptedQuestions = 0
    var currentQuestion = 0
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var respondView: UITextView!
    @IBOutlet weak var TrueBtn: UIButton!
    @IBOutlet weak var FalseBtn: UIButton!
    @IBOutlet weak var ContinueBtn: UIButton!
   

    override func viewDidLoad() {
        
       super.viewDidLoad()
        
        ScoringCGRect = Scoring.frame
        
        MainHeadlineCGRect = MainHeadline.frame
        TrueBtnCGRect = TrueBtn.frame
        FalseBtnCGRect = FalseBtn.frame
        
        
        
        
        
       // [Scoring,MainHeadline,TrueBtn,FalseBtn]
        
        
        
        
        
        
        Prodding = ["What do you think?", "Well? Is it good code or not?", "Choose one:...","Think it through first.", "Maybe this one is too easy...","Don't take all day!"," Choose True or False!", "These aren't trick questions.","The timer is going..", "Oh! An easy one.","Those are your choices below.", "Here are your choices","Go on be quick about it.","Read Carefully and choose your path."]
        Prodding.shuffle()
        respondView.text=Prodding[0]
        respondView.isEditable = false
        respondView.isSelectable = false
        ContinueBtn.isHidden = true
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
              
               for _ in 0...13 { correct.append(true)}
               for _ in 14...26 {correct.append(false)}
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
                gravityForFalse = true
                numCorrect += 1
               
                respondView.text="Correct! " + quizTwoQuestions[currentQuestion].comment
                view.backgroundColor = .green
            }
            else {//wrong answer chose false
                gravityForFalse = false
                respondView.text="InCorrect! " + quizTwoQuestions[currentQuestion].comment
                view.backgroundColor = .red
                putAnimationHere()
            }
        }
        else
        {//veracity ==false
            if idQ == false {
                gravityForFalse = true
                numCorrect += 1
                
                respondView.text="Correct! " + quizTwoQuestions[currentQuestion].comment
                view.backgroundColor = .green

            }
            else {
                gravityForFalse = false
                respondView.text="InCorrect! " + quizTwoQuestions[currentQuestion].comment
                view.backgroundColor = .red
                putAnimationHere()
            }
           
        }
 
        }
       
    func putAnimationHere() {
        
        animator = UIDynamicAnimator(referenceView:self.view)
         
     gravity = UIGravityBehavior(items:  [Scoring,MainHeadline,TrueBtn,FalseBtn])
       //  motion = CMMotionManager()
        gravity.setAngle(Double.pi/2, magnitude: 0.3)
         bouncy = UIDynamicItemBehavior(items:  [Scoring,MainHeadline,TrueBtn,FalseBtn])
         bouncy.elasticity = 0.8
         bouncy.addAngularVelocity(Double.random(in:-30...30), for: Scoring)
        bouncy.addAngularVelocity(Double.random(in:-30...30), for: MainHeadline)
        bouncy.addAngularVelocity(Double.random(in: -12...12), for: TrueBtn)
        bouncy.addAngularVelocity(Double.random(in:-12...12), for: FalseBtn)
        
         collision = UICollisionBehavior(items:  [Scoring,MainHeadline,TrueBtn,FalseBtn])
         collision.addBoundary(withIdentifier: "borders" as NSCopying, for: UIBezierPath(rect:self.view.frame))
         animator.addBehavior(bouncy)
         animator.addBehavior(collision)
         animator.addBehavior(gravity)
        
       
    }
    
    
    
    @IBAction func clickedTrue(_ sender: Any) {
       
        TrueBtn.isEnabled = false
        FalseBtn.isEnabled = false
        ContinueBtn.isEnabled = true
        ContinueBtn.isHidden = false
        FalseBtn.isHidden = true
        checkAnswer(idQ: true)
        
    }
    
    @IBAction func clickedFalse(_ sender: Any) {
       
        TrueBtn.isEnabled = false
        FalseBtn.isEnabled = false
        TrueBtn.isHidden = true
        ContinueBtn.isEnabled = true
        ContinueBtn.isHidden = false
        checkAnswer(idQ: false)
       
    }
    

    @IBAction func nextQuestion(_ sender: Any) {
        TrueBtn.isEnabled = true
        FalseBtn.isEnabled = true
        ContinueBtn.isEnabled = false
        ContinueBtn.isHidden = true
        TrueBtn.isHidden = false
        FalseBtn.isHidden = false
        Prodding.shuffle()
        attemptedQuestions += 1
        Scoring.text = "Score: \(numCorrect) : \(attemptedQuestions)"
        view.backgroundColor = .white
      //  FalseBtn.backgroundColor = .brown
        respondView.text = Prodding[0]
        currentQuestion += 1
        if currentQuestion == 27 {currentQuestion=0}//to do functionality
        let nAmE = quizTwoQuestions[currentQuestion].question
        image.image = UIImage(named: nAmE)
        
        if !gravityForFalse {
        animator.removeAllBehaviors()
        Scoring.frame = ScoringCGRect
        Scoring.transform = CGAffineTransform(rotationAngle: 0.0)
            Scoring.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
        MainHeadline.frame = MainHeadlineCGRect
        MainHeadline.transform = CGAffineTransform(rotationAngle:0.0)
        TrueBtn.frame = TrueBtnCGRect
        TrueBtn.transform = CGAffineTransform(rotationAngle: 0.0)
        FalseBtn.frame = FalseBtnCGRect
        FalseBtn.transform = CGAffineTransform(rotationAngle: 0.0)
        }
     //   [Scoring,MainHeadline,TrueBtn,FalseBtn]
    }
    
    
    

        
    
    
    
    


}


