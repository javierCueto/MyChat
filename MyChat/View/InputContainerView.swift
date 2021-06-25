//
//  InputContainerView.swift
//  MyChat
//
//  Created by Javier Cueto on 24/06/21.
//

import UIKit

class InputContainerView: UIView {
    
    init(image: UIImage, textField: UITextField){
        super.init(frame: .zero)
        setHeight(height: 50)
        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .white
        iv.alpha = 0.87
        
        addSubview(iv)
        iv.centerY(inView: self)
        iv.anchor(left: self.leftAnchor, paddingLeft: 8,width: 20)

        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: iv.rightAnchor, bottom:  self.bottomAnchor, right: self.rightAnchor, paddingLeft: 8 , paddingBottom: -2)
        
        let v = UIView()
        v.backgroundColor = .white
        v.setHeight(height: 0.75)
         addSubview(v)
        v.anchor(left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor , paddingLeft: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
