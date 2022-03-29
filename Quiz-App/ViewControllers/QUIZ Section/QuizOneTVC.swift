//
//  quizOneTVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/15/22.
//
// animatino reoutine for table effect at 280
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
 
   var holdCell : [UITableViewCell] = []
   var animator : UIDynamicAnimator!
   var gravity: UIGravityBehavior!
   var collision: UICollisionBehavior!
   var AllQuiz = [[String]]()
    var AQuiz = [String]()
    var answerKey = [Int]()
    var timer = Timer()
 
    
    override func viewWillDisappear(_ animated: Bool) {
       timer.invalidate()
        let defaults = UserDefaults.standard
        var  groundScore = defaults.object(forKey:"Scores") as! [String:Double]
        
        var AAA = defaults.integer(forKey:"UQA")
        var CCC = defaults.integer(forKey:"UQC")
        var TOP = Double(CCC)/Double(AAA)
        var roundTop = round(TOP*100)/100.0
        
        var UName = defaults.string(forKey:"username")
        groundScore[UName!]=roundTop
        
        defaults.set(groundScore,forKey:"Scores")
     
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
           
           
           
           timer = Timer.scheduledTimer(timeInterval:1.0,target:self,selector:#selector(fireTimer),userInfo:nil,repeats:true)
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
       
       
        
        LABEL!.text = runString
        self.view.addSubview(LABEL!)
    }
    
   

   override func numberOfSections(in tableView: UITableView) -> Int {
      
       return 1
   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        
       return 5//quiz[whichQuestion].answers?.count ?? 4
       
   }

   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       tableView.allowsSelection = true
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       cell.backgroundColor = .yellow
        cell.textLabel?.text = AllQuiz[whichQuestion][indexPath.row]
       
       
       return cell
   }
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = UIView(frame: CGRect(x:0, y:0 , width : tableView.frame.width,height: 130))
       view.backgroundColor = .orange
       
       let lbl = UILabel(frame: CGRect(x:15, y:10, width: view.frame.width-15,height: 130))
       lbl.text = quizOneDB[whichQuestion].question
       view.addSubview(lbl)
   
       return view
   
   }

   override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 130
   }
 
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       
       
       
       QuestionsAnswered+=1
       
       let defaults = UserDefaults.standard
      // defaults.set(0,forKey:"UQC")
       let frog = defaults.integer(forKey: "UQA") + 1
       defaults.set(frog,forKey:"UQA")
    
       
       tableView.deselectRow(at: indexPath, animated:true)
       if indexPath.row == answerKey[whichQuestion] {
           tableView.cellForRow(at: indexPath)?.backgroundColor = .green
           QuestionsCorrect+=1
           
           
           
           let defaults = UserDefaults.standard
          // defaults.set(0,forKey:"UQC")
           let frog = defaults.integer(forKey: "UQC") + 1
           defaults.set(frog,forKey:"UQC")
  
           
           
           
           tableView.allowsSelection = false
           
           self.whichQuestion += 1
           if self.whichQuestion == TotalQuestions {
               self.whichQuestion = 0
           }
           }

       else {
           tableView.cellForRow(at:indexPath)?.backgroundColor = .red
           tableView.allowsSelection = false
      
           
           }
           
                                                        
       handlerNewQuestion()
       }
   
 
   
   @IBAction func handlerNewQuestion() {
       Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
          
          
         //  configureUI()
           self.tableV.reloadData()
           self.refreshControl?.endRefreshing()
       }
   }
   
   
   override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
   
 
//
//   Animation for view transitions below.
//

       
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
 
