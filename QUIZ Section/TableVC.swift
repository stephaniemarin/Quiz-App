//
//  TableVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/11/22.
//

import UIKit

class Quiz {
   
    
    
    var question : String?
    var answers : [String]?
    var correct : Int
    init(question: String, answers:[String], correct : Int = 0){
        self.question = question
        self.answers = answers
        self.correct = correct
    }
}




class TableVC: UITableViewController {
    @IBOutlet var TableV: UITableView!
     var whichQuestion : Int = 0
    var quiz = [Quiz]()
    var holdCell : [UITableViewCell] = []
    var animator : UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    func ConfigureUI(){
        
       // TableV.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        quiz.append(Quiz.init(question: "1 + 1 = ", answers: ["2","5","6","8"],correct: 0))
        quiz.append(Quiz.init(question: "7 + 9 = ", answers: ["10","43","16","8"],correct: 2))
        quiz.append(Quiz.init(question: "9 + 9 = ", answers: ["34","12","6","18"],correct: 3))
        quiz.append(Quiz.init(question: "50 + 11 = ", answers: ["12","5","61","56"],correct: 2))
        quiz.append(Quiz.init(question: "22 + 14 = ", answers: ["76","36","58","18"],correct: 1))
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         
        return quiz[whichQuestion].answers?.count ?? 4
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        holdCell =  []
        tableView.allowsSelection = true
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        cell.textLabel?.text = quiz[whichQuestion].answers?[indexPath.row]

        
       // holdCell.append(cell)
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x:0, y:0 , width : tableView.frame.width,height: 130))
        view.backgroundColor = .gray
        
        let lbl = UILabel(frame: CGRect(x:15, y:10, width: view.frame.width-15,height: 130))
        lbl.text = quiz[whichQuestion].question
        view.addSubview(lbl)
        
        return view
    
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        
        tableView.deselectRow(at: indexPath, animated:true)
        if indexPath.row == quiz[whichQuestion].correct  {
            tableView.cellForRow(at: indexPath)?.backgroundColor = .green
            tableView.allowsSelection = false
            self.whichQuestion += 1
            if self.whichQuestion == 5 {
                self.whichQuestion = 0
            }
            }
    
        else {
            tableView.cellForRow(at:indexPath)?.backgroundColor = .red
            tableView.allowsSelection = false
          //  tableView.cellForRow(at: tableView.indexPathsForVisibleRows?[1]?).backGroundColor = .green
          // how to get an indexPath given known subscript or was indexPath.row
            //NextQuestionButton.hidden = false
            
            }
            
                                                         
        handlerNewQuestion()
        }
    
  
    
    @IBAction func handlerNewQuestion() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
           
           
          //  configureUI()
            self.TableV.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
//        animator = UIDynamicAnimator(referenceView: tableView)
//        gravity = UIGravityBehavior(items: [cell]])
//        animator.addBehavior(gravity)
//        collision = UICollisionBehavior(items: [cell]])
//        collision.translatesReferenceBoundsIntoBoundary = true
//        animator.addBehavior(collision)
//        let itemBehavior = UIDynamicItemBehavior(items: [cell]])
//        itemBehavior.elasticity = 0.8
//        animator.addBehavior(itemBehavior)
//
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
//
