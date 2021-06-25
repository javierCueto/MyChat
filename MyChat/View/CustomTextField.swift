//
//  CustomTextField.swift
//  MyChat
//
//  Created by Javier Cueto on 24/06/21.
//

import UIKit

class CustomTextFIeld: UITextField {
    init(placeholder: String, isSecure: Bool = false){
        super.init(frame: .zero)
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = .white
        keyboardAppearance = .dark
        isSecureTextEntry = isSecure
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
