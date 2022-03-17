//
//  WelcomeCollectionViewController.swift
//  IOS_QUIZ
//
//  Created by Stephanie Marin Velasquez on 3/15/22.
// welcome collection view controller

import UIKit


class WelcomeCollectionViewController: UICollectionViewController{
    
    var imageData = ["swift", "java", "python"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        func generateLayout() -> UICollectionViewLayout{
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(140.0))
            
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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let welCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "welCell1", for: indexPath) as! WelcomeCollectionViewCell
        let welCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "welCell2", for: indexPath) as! WelcomeCollectionViewCell
        let welCell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "welCell3", for: indexPath) as! WelcomeCollectionViewCell
    
        switch indexPath.section{
        case 0:
            welCell1.swiftImg.image = UIImage(named: imageData[indexPath.row])
            
            return welCell1
        case 1:
            welCell2.javaImg.image = UIImage(named: imageData[indexPath.row])
            return welCell2
        case 3:
            welCell3.pythonImg.image = UIImage(named: imageData[indexPath.row])
            return welCell3
        default:
            return welCell1
        }
    }
    
    private func generateLayout() ->UICollectionViewLayout{
       //item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(3.0), heightDimension: .fractionalHeight(3.0))
        // declaring item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70.0))
        //declaring group horizontal
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        //section
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        //after this tell viewdidload() to use the new layout
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
