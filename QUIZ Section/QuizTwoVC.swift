//
//  QuizTwoVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/16/22.
//

import UIKit

class QuizTwoVC: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var responseLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "test1")
        
        
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

}
