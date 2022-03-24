//
//  CreateAccountVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/12/22.
//

import UIKit

struct CurrentUserSI {
   var  name : String
    var score : Double
    var isAdmin : Bool
}

class CreateAccountVC: UIViewController {
     
    
    @IBOutlet weak var password2: UITextField!
    @IBOutlet weak var password1: UITextField!
    
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let isAdminLabel : UILabel = UILabel(frame:CGRect(x:140, y:440,width:160,height:40))
        isAdminLabel.text = "Check for Admin"
        // Do any additional setup after loading the view.
    }
    
 
    
    
    @IBAction func CreateAccount(_ sender: UIButton) {
        
        if name.text == "" {
            name.shake()
            return
        }
        
        if password1.text == password2.text && password1.text == "" {
            password1.shake()
            password2.shake()
            return
        }
        
        if password1.text != password2.text {
            password1.shake()
            password2.shake()
            password1.text = ""
            password2.text = ""
            return
        }
       
        // assuming enough checking
        let God = name.text!
        let Angel = password1.text!
//        let admin =
        let successSave = KeychainWrapper.standard.set(Angel, forKey: God)
       // print(successSave)
        let defaults = UserDefaults.standard
        defaults.set(God, forKey:"username")
       // defaults.set()
        defaults.set(true,forKey:"check")
        defaults.set(0,forKey:"UQA")
        defaults.set(0,forKey:"UQC")
        
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let goToWelcome = storyBoard.instantiateViewController(withIdentifier: "Welcome") as! WelcomeVC
//        self.present(goToWelcome,animated: true,completion: nil)
//        
       // print(name.text)
      //  print(password1.text)
    }
    
    
    
    
    

    @IBAction func ReturnToLoginPage(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let goToLogin = storyBoard.instantiateViewController(withIdentifier: "LoginPage") as! LoginVC
        self.present(goToLogin,animated: true,completion: nil)
   
    }
  

}


extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x:self.center.x - 4.0, y:self.center.y)
        animation.toValue = CGPoint(x:self.center.x + 4.0,y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
