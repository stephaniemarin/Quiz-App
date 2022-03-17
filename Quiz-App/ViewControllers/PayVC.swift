//
//  PayVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/12/22.
//

import UIKit

class PayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
