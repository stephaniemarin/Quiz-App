//
//  MatchQuizVC.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/22/22.
//

import UIKit
import SwiftUI

class MatchQuizVC: UIViewController {

    @IBSegueAction func hostUI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: quiz3())
    }
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

}
