//
//  MatchQuizVC.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/22/22.
//

import UIKit
import SwiftUI
import FacebookLogin


class WelcomeVC: UIViewController {


    @IBSegueAction func quiz3UI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: quiz3())
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //facebook login
        let loginButton = FBLoginButton()
        loginButton.center = CGPoint( x: 130, y: 110)

        view.addSubview(loginButton)
        if let token = AccessToken.current,
                !token.isExpired {
            
        // Do any additional setup after loading the view.
        }
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
