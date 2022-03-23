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
    
    
    
    @IBOutlet weak var loginoutBtn: UIButton!
    //labels z
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var titleScores: UILabel!
    @IBOutlet weak var subscriptionlb: UILabel!
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
    

    override func viewWillAppear(_ animated: Bool){
    //   super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        UserQuestionsAnswered = defaults.integer(forKey:"UQA")
        UserQuestionsCorrect = defaults.integer(forKey:"UQC")
        print("I entered this method now")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sign In Button
        //loginAndOUT()
        let defaults = UserDefaults.standard
        let Nname = defaults.string(forKey: "username")
        UserQuestionsAnswered = defaults.integer(forKey:"UQA")
        UserQuestionsCorrect = defaults.integer(forKey:"UQC")

        if Nname != "" && Nname != nil{
            loginoutBtn.setTitle("Settings",for: .normal)
            name.text = "Welcome " + Nname!
            titleScores.text = "Your Quiz Scores"
            subscriptionlb.text = "Your subcription Quizes"
            //loginoutBtn = sender.setTitle("settings", for: .normal)
            titleScores.text = "Cumulative Score:  \(UserQuestionsCorrect) / \(UserQuestionsAnswered)"
        }
        else {
            subscriptionlb.text = "Subscribe for more quizes!"
            loginoutBtn.setTitle("Sign In",for: .normal)
            createDataBase.isHidden.toggle()
            multipleChoiceQuiz.isHidden.toggle()
            truFalseQuiz.isHidden.toggle()
            matchingQuiz.isHidden.toggle()
            
        }
        
        
        //facebook login
        let loginButton = FBLoginButton()
        loginButton.center = CGPoint( x: 130, y: 110)

        view.addSubview(loginButton)
        if let token = AccessToken.current,
                !token.isExpired {
            
            
        // Do any additional setup after loading the view.
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
