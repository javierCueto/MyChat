//
//  LoginButton.swift
//  MyChat
//
//  Created by Javier Cueto on 25/06/21.
//

import UIKit

class LoginButton: UIButton {
    init(title: String){
        super.init(frame: .zero)

        setTitle(title , for: .normal)
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        setHeight(height: 50)
        backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        tintColor = .white

    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
