//
//  PayVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/12/22.
//

import UIKit

class PayVC: UIViewController {

    @IBOutlet weak var PayIdentity: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        PayIdentity.text = "Under the conditions of your employment as Software Engineers for Revature, you have agreed to some monetary arrangement based on future work. This app is part of said contract. You may opt out of this agreement by just leaving this app . By going to Settings you will be taken to a Log Out page. Please Unselect the Checkmark for subscription, before leaving. We would also like to thank you for trying out this app. Please leave a feedback comment."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GOTOHERE(_ sender: Any) {
    
   
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "CollectionCenter") as? CollectionVC {
            self.present(vc,animated:true)
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
