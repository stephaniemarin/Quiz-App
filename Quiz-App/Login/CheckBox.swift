//
//  CheckBox.swift
//  CASH
//
//  Created by stephen weber on 3/5/22.
// (LEARNT from Afraz Siddiqui ios Academy)



import Foundation
import UIKit

 
class CheckBox: UIView {
    
  var isChecked = true
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        imageView.image = UIImage(systemName:"checkmark")
        return imageView
    }()
    
    
    let boxView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor
        return view
        
    }()
    
    override init(frame:CGRect) {
        
        super.init(frame: frame)
      
            self.isChecked = true
       
        //backgroundColor = .red
        addSubview(boxView)
        addSubview(imageView)
        clipsToBounds = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) look this up if you see this..")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        boxView.frame = CGRect(x: 7, y:7, width: frame.size.width-14, height: frame.size.width-14)
        imageView.frame = bounds
    }
    
    public func startHidden() {
        imageView.isHidden.toggle()
        boxView.isHidden.toggle()
       
    }
 
    public func toggle() {
        self.isChecked = !isChecked
        imageView.isHidden = !isChecked
       // ClientSigned = !ClientSigned
        
        
        print("toggled")
    }
}
