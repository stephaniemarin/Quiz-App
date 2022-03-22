//
//  WelcomeCollectionViewController.swift
//  IOS_QUIZ
//
//  Created by Stephanie Marin Velasquez on 3/15/22.
// welcome collection view controller

import UIKit
import FacebookLogin
import SwiftUI


class WelcomeCollectionViewController: UICollectionViewController{
    
    var imageData = ["einstain", "swift", "java", "python"]
    var TextData = ["Login","Pay","Feedback","Swift Language", "Programming","IOS"]
    var loginChecked = false
    var signupChecked = true

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        func generateLayout() -> UICollectionViewLayout{
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.97))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150.0))
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            let layout = UICollectionViewCompositionalLayout(section: section)
            
            return layout
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 8
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: "loginCell", for: indexPath) as! WelcomeCollectionViewCell
        
        let welCell = collectionView.dequeueReusableCell(withReuseIdentifier: "welCell", for: indexPath) as! WelcomeCollectionViewCell
        let quizCell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as! WelcomeCollectionViewCell

        let quiz2Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quiz2Cell", for: indexPath)
       
        let createMultQuiz = collectionView.dequeueReusableCell(withReuseIdentifier: "createMultQuiz", for: indexPath)
        
        let payAndFeedback = collectionView.dequeueReusableCell(withReuseIdentifier: "payAndFeedback", for: indexPath)
        let sampleQuiz = collectionView.dequeueReusableCell(withReuseIdentifier: "sampleQuiz", for: indexPath)
        let matchQuiz = collectionView.dequeueReusableCell(withReuseIdentifier: "matchQuiz", for: indexPath)
        
        
        switch indexPath.section{
        case 0:
//            //facebook login
//            let loginButton = FBLoginButton()
//            loginButton.center = CGPoint( x: 110, y: 110)
//            view.addSubview(loginButton)
//            if let token = AccessToken.current,
//                    !token.isExpired {
//                
//            }
            
            loginCell.loginbtn.layer.cornerRadius = 20
            loginCell.logOutbtn.layer.cornerRadius = 20
            
            return loginCell
        case 1:
            //welCell2.javaImg.image = UIImage(named: imageData[indexPath.row])
            welCell.proglang.image = UIImage(named: imageData[indexPath.row])
            return welCell
        case 2:
//            quizCell.swiftImg.image = UIImage(named: imageData[indexPath.row])
            return quizCell
        case 3:
            return quiz2Cell
        case 4:
            return createMultQuiz
        case 5:
            return payAndFeedback
        case 6:
            return sampleQuiz
        case 7:
            return matchQuiz
        default:
            return loginCell
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    
        
    }
    
//    private func generateLayout() ->UICollectionViewLayout{
//       //item size
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(3.0), heightDimension: .fractionalHeight(2.0))
//
//        // declaring item
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        //group size
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .absolute(30.0))
//        //declaring group horizontal
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 7)
//        //section
//        let section = NSCollectionLayoutSection(group: group)
//        let layout = UICollectionViewCompositionalLayout(section: section)
//
//        return layout
//        //after this tell viewdidload() to use the new layout
//    }
}
