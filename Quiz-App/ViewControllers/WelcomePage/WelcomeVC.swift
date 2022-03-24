//
//  MatchQuizVC.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/22/22.
//

import UIKit
import SwiftUI
import FacebookLogin

struct CurrentUserWel {
   var  name : String
    var score : Double
}

class WelcomeVC: UIViewController {

    var CurrentUser:String = ""
    var UserQuestionsAnswered = 0
    var UserQuestionsCorrect = 0
    
    var USERS:[String] = ["Admin","Horses","Mouse","Giraffe","Elephant","Pony"]
    
    
    
    @IBOutlet weak var HighScores: UILabel!
    var Scores = [String:Double]()
    
    
    
    @IBOutlet weak var UserList: UIButton!
    @IBOutlet weak var loginoutBtn: UIButton!
    //labels z
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var titleScores: UILabel!
    
    @IBOutlet weak var subscriptionlb: UILabel!
    
//    @IBOutlet weak var subscriptionlb: UILabel!
    //buttons
    @IBOutlet weak var sampleQuiz: UIButton!
    @IBOutlet weak var createDataBase: UIButton!
    @IBOutlet weak var multipleChoiceQuiz: UIButton!
    @IBOutlet weak var truFalseQuiz: UIButton!
    @IBOutlet weak var matchingQuiz: UIButton!
    @IBOutlet weak var feedback: UIButton!
    @IBOutlet weak var subscription: UIButton!
    
       
    //hosting swiftui view
    @IBSegueAction func quiz3UI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: quiz3())
    }
    

    @IBSegueAction func gotoUserList(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView:UserDirectory())
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool){
        
        
        
    super.viewWillAppear(animated)
        
        
        
        
        
        let defaults = UserDefaults.standard
        let yyy = defaults.object(forKey:"Users")
        if yyy == nil {
            print("well that is inside of the user defaults")
        
       let picket = ["Admin","Horse","Mouse","Giraffe","Elephant","Pony"]
            defaults.set(picket,forKey:"Users")
            
            let bestGames = ["Admin": 0.0,"Horse":0.95,"Giraffe": 0.93,"Elephant":0.8,"Mouse":0.3,"Pony":0.7]
            defaults.set(bestGames,forKey:"Scores")
            
            Scores = bestGames
            print("Should put in Scores here")
            
            
        }
        var top=[Double]()
        for i in Scores.values{top.append(i)}
        let top2 = Array(top.sorted().reversed())
        print (Scores)
        let top3 = top2[0...2]
      
        
        var theBest=[String]()
        for (i,j) in Scores { if top3.contains(j) {theBest.append(i)}}
        
        //outputString
        
        let outputString = "\(theBest[0]): \(Scores[theBest[0]]!) , \(theBest[1]): \(Scores[theBest[1]]!) , \(theBest[2]): \(Scores[theBest[2]]!)"
        
        HighScores.text = outputString
      
        
        
        UserQuestionsAnswered = defaults.integer(forKey:"UQA")
        UserQuestionsCorrect = defaults.integer(forKey:"UQC")
        print("I entered this method now")
        titleScores.text = "Cumulative Score:  \(UserQuestionsCorrect) / \(UserQuestionsAnswered)"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sign In Button
        //loginAndOUT()
        
        
        let defaults = UserDefaults.standard
        let yyy = defaults.object(forKey:"Users")
        if yyy == nil {
            print("well that is inside of the user defaults")
        
       let picket = ["Admin","Horse","Mouse","Giraffe","Elephant","Pony"]
            defaults.set(picket,forKey:"Users")
            
            let bestGames = ["Admin": 0.0,"Horse":0.95,"Giraffe": 0.93,"Elephant":0.8,"Mouse":0.3,"Pony":0.7]
            defaults.set(bestGames,forKey:"Scores")
            
            Scores = bestGames
            print("Should put in Scores here")
            
            
        }
        
        
        
        
        
        
        createDataBase.isHidden = true
        UserList.isHidden = true
       // let defaults = UserDefaults.standard
        var Nname = defaults.string(forKey: "username")
        UserQuestionsAnswered = defaults.integer(forKey:"UQA")
        UserQuestionsCorrect = defaults.integer(forKey:"UQC")
        Scores = defaults.object(forKey:"Scores") as! [String : Double]
        print("Current username is \(Nname)")
        
        //facebook login
        let loginButton = FBLoginButton()
        loginButton.center = CGPoint( x: 130, y: 110)

        view.addSubview(loginButton)
        if let token = AccessToken.current,
                !token.isExpired {
            
            let token = token.tokenString
            let req = FacebookLogin.GraphRequest(graphPath: "me", parameters: ["fields": "email, first_name, last_name"], tokenString: token, version:nil, httpMethod: .get)
            
            
            // Note this part
            //
            //
            //
            
            Nname = "FacebookUser"
            if !USERS.contains(Nname!) {
                USERS.insert(Nname! ,at:0)
                defaults.set(USERS,forKey:"Users")
            }
            //
            //
            // need to know from req how to get username string
            // I cannot test string for first_name without account so detail.
            req.start{
                con,result ,error in
                print(result)
                
            }
            
        // Do any additional setup after loading the view.
        }
    //endfacebook need to name facebookuser
        if Nname != nil && Nname != "" {
        if Nname! == "Admin" {
            print("Showing the paths for power")
            createDataBase.isHidden = false
            UserList.isHidden = false
        }
        }
        
        
        
       if Nname != "" && Nname != nil{
            loginoutBtn.setTitle("Settings",for: .normal)
            name.text = "Welcome " + Nname!
           let tempName = Nname ?? "checkBalance"
         
           
           
           
            titleScores.text = "Your Quiz Scores"
            subscriptionlb.text = "Your subcription Quizes"
            //loginoutBtn = sender.setTitle("settings", for: .normal)
           
        //   createDataBase.isHidden = true
        //   UserList.isHidden = true
           
           
            titleScores.text = "Cumulative Score:  \(UserQuestionsCorrect) / \(UserQuestionsAnswered)"
        }
        else {
            subscriptionlb.text = "Subscribe for more quizes!"
            loginoutBtn.setTitle("Sign In",for: .normal)
            
            multipleChoiceQuiz.isHidden.toggle()
            truFalseQuiz.isHidden.toggle()
            matchingQuiz.isHidden.toggle()
            
            if Nname != "Admin" {
                
                createDataBase.isHidden = true
                UserList.isHidden = true
            }
        }
        
    }
    
    func loginAndOUT(){
        
    }
    
    func getKeyChainPassword()-> String{
        var outputP : String = ""
    if name.text != "" {
        let God = name.text!
        outputP = KeychainWrapper.standard.string(forKey: God ) ?? "NO ACCOUNT"
        }
        return outputP
    }
       
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
