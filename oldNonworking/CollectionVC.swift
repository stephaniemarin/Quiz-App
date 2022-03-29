//
//  CollectionVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/12/22.
//

import UIKit
 var DataStuff = ["Login","Pay","Feedback","Swift Language", "Programming","IOS"]
private let reuseIdentifier = "Cell"

class CollectionVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        return DataStuff.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cells = UICollectionViewCell()
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ViewCell {
        
        cell.configure(with: DataStuff[indexPath.row])
    
        // Configure the cell
    
       cells = cell
    }
        return cells
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected : \(DataStuff[indexPath.row])")
        print(indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        switch indexPath.row {
        case 0:
            //
            print("one")
            if let vc = storyboard.instantiateViewController(withIdentifier: "LoginPage") as? LoginVC {
                self.present(vc,animated:true)
            }
        case 1:
            if let vc = storyboard.instantiateViewController(withIdentifier: "PayPage") as? PayVC {
                self.present(vc,animated:true)
            }
        case 2:
           
            if let vc = storyboard.instantiateViewController(withIdentifier: "FeedbackPage") as? FeedbackVC {
                 self.present(vc,animated:true)
                
            }
        case 3:
            if let vc = storyboard.instantiateViewController(withIdentifier: "TablePage") as? TableVC {
                self.present(vc,animated:true)
                
            }
        default:
            return
        }
        
        
        
        
        
        
        
    }
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
