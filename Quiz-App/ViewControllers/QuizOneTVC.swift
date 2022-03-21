//
//  quizOneTVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/15/22.
//

import UIKit
import SQLite3

struct ReOrder {
    var s1: String
    var s2: String
    var s3: String
    var s4: String
    var s5: String
}



class QuizOneTVC: UITableViewController {
    var runCount:Int=0
    var LABEL:UILabel?
    var QuestionsCorrect:Int = 0
    var QuestionsAnswered:Int = 0
    var runString:String = " "
    var db : OpaquePointer?
    var quizOneDB = [QuizOneDB]()
    @IBOutlet var tableV: UITableView!
    var whichQuestion : Int = 0
    var TotalQuestions : Int = 0
  // var quiz = [Quiz]()
   var holdCell : [UITableViewCell] = []
   var animator : UIDynamicAnimator!
   var gravity: UIGravityBehavior!
   var collision: UICollisionBehavior!
   var AllQuiz = [[String]]()
    var AQuiz = [String]()
    var answerKey = [Int]()
    
   func ConfigureUI(){
       
      // TableV.reloadData()
       
   }
   override func viewDidLoad() {
       super.viewDidLoad()
       if let fileURL = Bundle.main.url(forResource: "IOS", withExtension: "sqlite") {
           
           print("Found file!!!")
           if sqlite3_open(fileURL.path,&db) != SQLITE_OK {
               print("Sobbing crocodile tears.")
               return
           }
           else {
               print ("Found database!!!")
           }
          
           let query = "select * from q1"
           
           var stmt : OpaquePointer?
           
           if sqlite3_prepare(db,query,-2,&stmt,nil) != SQLITE_OK {
               let err = String(cString: sqlite3_errmsg(db))
               print("oh error  \(err)")
           }
           
           while (sqlite3_step(stmt) == SQLITE_ROW) {
               
               let id = sqlite3_column_int(stmt,0)
               let q = String(cString:sqlite3_column_text(stmt,1))
               let c = String(cString:sqlite3_column_text(stmt,2))
               let w1 = String(cString:sqlite3_column_text(stmt,3))
               let w2 = String(cString:sqlite3_column_text(stmt,4))
               let w3 = String(cString:sqlite3_column_text(stmt,5))
               let w4 = String(cString:sqlite3_column_text(stmt,6))
               
               quizOneDB.append(QuizOneDB(id: Int(id),question: q,answer: c,wrong1: w1,wrong2: w2,wrong3: w3,wrong4: w4))
               var h = [w1,w2,w3,w4].shuffled()
               AQuiz = [String]()
               let answ = Int.random(in:0...4)
               answerKey.append(answ)
               for x in 0...4 {
                   if x == answ {
                       AQuiz.append(c)
                       
                   }
                   else {
                       AQuiz.append(h.popLast()!)
                       
                   }
               }
               AllQuiz.append(AQuiz)
               
               
               
               
               
           }
           print()
           
           for Q in quizOneDB {
               print("(\(Q.id))  \(String(Q.question!))")
               print()
               print(".... \(String(Q.answer!))")
               print("/// \(String(Q.wrong1!))")
               print("/// \(String(Q.wrong2!))")
               print("/// \(String(Q.wrong3!))")
               print("/// \(String(Q.wrong4!))")
                 
               print()
               print()
               
           }
           TotalQuestions = quizOneDB.count
           print(whichQuestion)
           print("Did I print 18")
           
           
           
           let timer = Timer.scheduledTimer(timeInterval:1.0,target:self,selector:#selector(fireTimer),userInfo:nil,repeats:true)
           //fireTimer()
           print("Welll I printed here")
           
           LABEL = UILabel(frame: CGRect(x:0,y:0,width:400,height:60))
           LABEL!.center = CGPoint(x:214,y:600)
           self.view.addSubview(LABEL!)
       }
       else {
           print("oh no what is wrong dearie")
           return
       }
       
       
       
//
//       quiz.append(Quiz.init(question: "1 + 1 = ", answers: ["2","5","6","8"],correct: 0))
//       quiz.append(Quiz.init(question: "7 + 9 = ", answers: ["10","43","16","8"],correct: 2))
//       quiz.append(Quiz.init(question: "9 + 9 = ", answers: ["34","12","6","18"],correct: 3))
//       quiz.append(Quiz.init(question: "50 + 11 = ", answers: ["12","5","61","56"],correct: 2))
//       quiz.append(Quiz.init(question: "22 + 14 = ", answers: ["76","36","58","18"],correct: 1))
//
       
       
       // Uncomment the following line to preserve selection between presentations
       // self.clearsSelectionOnViewWillAppear = false

       // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       // self.navigationItem.rightBarButtonItem = self.editButtonItem
   }

    func minutesSeconds(_ seconds: Int) -> String {
        
        return ("(30 Mins Max)  \(seconds/60) min : \(seconds%60) sec            Score:\(QuestionsCorrect)/\(QuestionsAnswered)")
    }
    
    
    
    @objc func fireTimer() {
        print ("Firing")
        runCount+=1
        runString=String(minutesSeconds(runCount))
        print(runString)
        self.tableV.headerView(forSection: 0)?.reloadInputViews()
       
        //_=navigationController?.popToRooViewController(animated: true)
        //self.dismiss(animated:true,completion:nil)
        
        
        
        LABEL!.text = runString
        self.view.addSubview(LABEL!)
    }
    
    
   // MARK: - Table view data source

   override func numberOfSections(in tableView: UITableView) -> Int {
       // #warning Incomplete implementation, return the number of sections
       return 1
   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // #warning Incomplete implementation, return the number of rows
        
       return 5//quiz[whichQuestion].answers?.count ?? 4
       
   }

   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // var holdcCell = []
       tableView.allowsSelection = true
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       cell.backgroundColor = .yellow
        cell.textLabel?.text = AllQuiz[whichQuestion][indexPath.row] //quiz[whichQuestion].answers?[indexPath.row]

       
       //holdCell.append(cell)
       
       
       return cell
   }
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = UIView(frame: CGRect(x:0, y:0 , width : tableView.frame.width,height: 130))
       view.backgroundColor = .orange
       
       let lbl = UILabel(frame: CGRect(x:15, y:10, width: view.frame.width-15,height: 130))
       lbl.text = quizOneDB[whichQuestion].question
       view.addSubview(lbl)
     //  let lbl2 = UILabel(frame:CGRect(x:15,y:0,width:view.frame.width,height:30))
    //   lbl2.text = runString
     //  view.addSubview(lbl2)
       return view
   
   }

   override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 130
   }
 
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       
       
       
       QuestionsAnswered+=1
       tableView.deselectRow(at: indexPath, animated:true)
       if indexPath.row == answerKey[whichQuestion] {
           tableView.cellForRow(at: indexPath)?.backgroundColor = .green
           QuestionsCorrect+=1
           tableView.allowsSelection = false
           
           self.whichQuestion += 1
           if self.whichQuestion == TotalQuestions {
               self.whichQuestion = 0
           }
           }

       else {
           tableView.cellForRow(at:indexPath)?.backgroundColor = .red
           tableView.allowsSelection = false
        //   tableView.cellForRow(at: tableView.indexPathsForVisibleRows?[1]?).backGroundColor = .green
        //  how to get an indexPath given known subscript or was indexPath.row
       //    NextQuestionButton.hidden = false
           
           }
           
                                                        
       handlerNewQuestion()
       }
   
 
   
   @IBAction func handlerNewQuestion() {
       Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
          
          
         //  configureUI()
           self.tableV.reloadData()
           self.refreshControl?.endRefreshing()
       }
   }
   
   
   override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
   
//        animator = UIDynamicAnimator(referenceView: tableView)
//        gravity = UIGravityBehavior(items: [cell])
//        animator.addBehavior(gravity)
//        collision = UICollisionBehavior(items: [cell])
//        collision.translatesReferenceBoundsIntoBoundary = true
//        animator.addBehavior(collision)
//        let itemBehavior = UIDynamicItemBehavior(items: [cell])
//        itemBehavior.elasticity = 0.8
//        animator.addBehavior(itemBehavior)


       
       cell.transform = CGAffineTransform(translationX: 0, y: 50)
       cell.alpha = 0
       UIView.animate(
       withDuration: 0.7,
       delay:0.05 * Double(indexPath.row),
       usingSpringWithDamping: 0.2,
       initialSpringVelocity: 0.1,
       options: [.curveEaseInOut],

       animations: {
           cell.alpha = 1
           cell.transform = CGAffineTransform(translationX: 0, y: 0)
       })
       }
       
   
   
   
   @IBAction func GOTOHERE(_ sender: Any) {
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
               if let vc = storyboard.instantiateViewController(withIdentifier: "CollectionCenter") as? CollectionVC {
           self.present(vc,animated:true)
        
   }
}
}
//typealias Animation = (UITableViewCell,IndexPath, UITableView)-> Void
//
//
//final class Animator {
//    private var hasAnimatedAllCells = false
//    private let animation: Animation
//
//    init(animation: @escaping Animation) {
//        self.animation = animation
//    }
//
//    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
//        guard !hasAnimatedAllCells else {return}
//
//        animation(cell,indexPath,tableView)
//        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
//    }
//
//
//}


