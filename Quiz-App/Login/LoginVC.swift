//
//  LoginVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/12/22.
//

import UIKit

struct CurrentUser {
   var  name : String
    var score : Double
}

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let ContinuedSignInCheckBox = CheckBox(frame:CGRect(x: 100, y:240, width: 40, height:40))
    let PAYCASH = CheckBox(frame:CGRect(x:100,y:300, width: 40,height:40))
    override func viewDidLoad() {
        super.viewDidLoad()
        ContinuedSignInCheckBox.startHidden()
       PAYCASH.startHidden()
        let defaults = UserDefaults.standard
        let Nname = defaults.string(forKey: "username")
        if Nname != "" && Nname != nil {
            ContinuedSignInCheckBox.startHidden()
           PAYCASH.startHidden()
            print("JAVE USER DEFUALTS")
         
            
            view.addSubview(PAYCASH)
           
            
            let signInLabel : UILabel = UILabel(frame:CGRect(x:150, y:240,width:160,height:40))
            signInLabel.text = "Stay Logged In"
           
            view.addSubview(signInLabel)
           
            
            let CASH : UILabel = UILabel(frame:CGRect(x:150,y:300, width:160,height:40))
            CASH.text = "Paid Subscription"
          
            
            view.addSubview(CASH)
           
            
            name.text = Nname
            
            let CGsture = UITapGestureRecognizer(target:self,action: #selector(didTapCASH))
            PAYCASH.addGestureRecognizer(CGsture)
            let gesture = UITapGestureRecognizer(target:self,action: #selector(didTapCheckBox))
            ContinuedSignInCheckBox.addGestureRecognizer(gesture)
            let checked = defaults.bool(forKey: "check")
            ContinuedSignInCheckBox.isChecked = checked
         
            
            
            view.addSubview(ContinuedSignInCheckBox)
          
            
            
            
            
            password.text = getKeyChainPassword()
        
            name.isHidden.toggle()
            password.isHidden.toggle()
        
        // Do any additional setup after loading the view.
    }
    }
    
    @objc func didTapCheckBox(){
        print("good")
        ContinuedSignInCheckBox.toggle()
        name.isHidden.toggle()
        password.isHidden.toggle()
        let defaults = UserDefaults.standard
        defaults.set(ContinuedSignInCheckBox.isChecked, forKey: "check")
    }
    
    
    @objc func didTapCASH() {
        PAYCASH.toggle()
        // money things
    }
    
    
    @IBAction func EnterMainCenter(_ sender: Any) {
        
        if name.text == "" {
            name.shake()
            return
        }
        if password.text == "" {
            password.shake()
            return
        }
        
        let getP = getKeyChainPassword()
        if password.text != getP {return}
        
        
        // I guess password is same as stored KeyChain version
        
       
            //
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let goToLogin = storyBoard.instantiateViewController(withIdentifier: "CollectionCenter") as! CollectionVC
        self.present(goToLogin,animated: true,completion: nil)
         
        
    
    }
    
        func getKeyChainPassword()-> String{
            var outputP : String = ""
        if name.text != "" {
            let God = name.text!
        outputP = KeychainWrapper.standard.string(forKey: God ) ?? "NO ACCOUNT"
    }
            return outputP
        }
            
    
    
    
    @IBAction func ActivateAccount(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let goToActivateAccount = storyBoard.instantiateViewController(withIdentifier: "CreateAccount") as! CreateAccountVC
        self.present(goToActivateAccount,animated: true,completion: nil)
        
        
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
