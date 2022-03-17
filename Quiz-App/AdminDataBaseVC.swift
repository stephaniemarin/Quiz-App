//
//  AdminDataBaseVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/15/22.
//

import UIKit
import SQLite3




class AdminDataBaseVC: UIViewController {
    
    @IBOutlet weak var nameOfDB: UITextField!
   
    
    @IBOutlet weak var questionDB: UITextField!
    @IBOutlet weak var correctAnswerDB: UITextField!
    
   
    @IBOutlet weak var wrongAnswer1DB: UITextField!
    @IBOutlet weak var wrongAnswer2DB: UITextField!
    @IBOutlet weak var wrongAnswer3DB: UITextField!
    @IBOutlet weak var wrongAnswer4DB: UITextField!
    
    
    var db : OpaquePointer?
    var quizOneDB = [QuizOneDB]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
 ////OUTLET ACTIONS
    ///

    
    
    @IBAction func MakeDataBase(_ sender: Any) {
        if nameOfDB.text == "" {return}
     
        let databaseName = nameOfDB.text!+".sqlite"
        let fileP = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(databaseName)
        
        print("db path  is  ", fileP)
        
        if sqlite3_open(fileP.path, &db) != SQLITE_OK {
            print("broken open error")
            
        }
        

        
        if sqlite3_exec(db, "create table if not exists q1 (id integer primary key autoincrement, question text, answer text, wrong1 text, wrong2 text, wrong3 text, wrong4 text )", nil, nil,nil) != SQLITE_OK {
            
            let err = String(cString: sqlite3_errmsg(db)!)
            print("The error here is \(err)")
        
        }
        
        
        
        
        
        
    }
    
    @IBAction func AddQuestionToDB(_ sender: Any) {
 
        let qnDB = questionDB.text as! NSString
        let caDB = correctAnswerDB.text as! NSString
        let w1DB = wrongAnswer1DB.text as! NSString
        let w2DB = wrongAnswer2DB.text as! NSString
        let w3DB = wrongAnswer3DB.text as! NSString
        let w4DB = wrongAnswer4DB.text as! NSString
        
        var stmt : OpaquePointer?
        
        
        let query = "insert into q1 (question, answer, wrong1, wrong2, wrong3, wrong4) values (?,?,?,?,?,?)"
        
        if sqlite3_prepare_v2(db,query,-1,&stmt,nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("oh prepare\(err)")
        }
        
        if sqlite3_bind_text(stmt,1,qnDB.utf8String,-1 ,nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("ohbindtext1   \(err)")
        }
        if sqlite3_bind_text(stmt,2,caDB.utf8String,-1, nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("ohbindtext2   \(err)")
        }
        if sqlite3_bind_text(stmt,3,w1DB.utf8String,-1 ,nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("ohbindtext2   \(err)")
        }
        if sqlite3_bind_text(stmt,4,w2DB.utf8String,-1 ,nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("ohbindtext4   \(err)")
        }
        if sqlite3_bind_text(stmt,5,w3DB.utf8String,-1 ,nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("ohbindtext5   \(err)")
        }
        if sqlite3_bind_text(stmt,6,w4DB.utf8String,-1 ,nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("ohbindtext6   \(err)")
        }
      
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let err = String(cString: sqlite3_errmsg(db))
            print("oh step   \(err)")
        }
        
        
     
        questionDB.text = ""
        correctAnswerDB.text = ""
        wrongAnswer1DB.text = ""
        wrongAnswer2DB.text = ""
        wrongAnswer3DB.text = ""
        wrongAnswer4DB.text = ""
         
         
    
        
    }
    
    
    @IBAction func ViewDataBase(_ sender: Any) {
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
        
        
        
    }
    
    
    
    
}
