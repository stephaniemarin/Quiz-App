//
//  WelcomeCollectionViewController.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/16/22.
//

import UIKit

/*
class WelcomeCollectionViewController: UICollectionViewController {

    var imageData = ["swift"]
    var textData = ["Swift Quiz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "welCell")

        // Do any additional setup after loading the view.
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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let welCell = collectionView.dequeueReusableCell(withReuseIdentifier: "welCell", for: indexPath) as! WelcomeCVCell
    
        // Configure the cell
    
        switch indexPath.section{
        case indexPath.item:
            welCell.quizImg.image = UIImage(named: imageData[indexPath.row])
            welCell.quizTitle.text = textData[indexPath.row]
            return welCell
        default:
            return welCell
        }
    }

  

}
*/
