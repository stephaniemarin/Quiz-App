//
//  ViewCell.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/12/22.
// here is a comment

//comment here

import UIKit

class ViewCell: UICollectionViewCell {
   
    @IBOutlet weak var label: UILabel!
    
    func configure(with name: String) {
        label.text = name
    }
    
    
}
