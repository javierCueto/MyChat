//
//  LoginController.swift
//  MyChat
//
//  Created by Javier Cueto on 22/06/21.
//

import UIKit

class LoginController: UIViewController {
    // MARK: -  Properties
    private let iconImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "text.bubble")
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var emailContainerView: InputContainerView = {
        let containerView = InputContainerView(image: UIImage(systemName: "envelope")!, textField: emailTextField)
        return containerView
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        let containerView = InputContainerView(image: UIImage(systemName: "lock")!, textField: passwordTextField)
        return containerView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setHeight(height: 50)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        return button
    }()
    
    private let passwordTextField = CustomTextFIeld(placeholder: "Password", isSecure: true)
    
    private let emailTextField = CustomTextFIeld(placeholder: "Email")
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    // MARK: -  Helpers
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .systemBlue
        
        configureGradientLayer()
        
        configureIcon()
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    func configureIcon(){
        view.addSubview(iconImage)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 15 ,width: 120, height: 120)
        iconImage.centerX(inView: view)
    }
    
 
    // MARK: -  Actions
}
