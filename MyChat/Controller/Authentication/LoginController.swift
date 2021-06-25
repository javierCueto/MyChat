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
    
    private lazy var emailContainerView: UIView = {
        let containerView = UIView()
        //containerView.backgroundColor = .yellow
        
        let iv = UIImageView()
        iv.image = UIImage(systemName: "envelope")
        iv.tintColor = .white
        
        
        containerView.addSubview(iv)
        iv.centerY(inView: containerView)
        iv.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 20, width: 24)
        
        containerView.addSubview(emailTextField)
        emailTextField.centerY(inView: containerView)
        emailTextField.anchor(left: iv.rightAnchor, bottom:  containerView.bottomAnchor, right: containerView.rightAnchor, paddingLeft: 8 , paddingBottom: -2)
        
        let v = UIView()
        v.backgroundColor = .white
        v.setHeight(height: 2)
        containerView .addSubview(v)
        v.anchor(left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor , paddingLeft: 10)
        
        containerView.setHeight(height: 50)
        return containerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let containerView = UIView()
        
        let iv = UIImageView()
        iv.image = UIImage(systemName: "lock")
        iv.tintColor = .white
        
        containerView.addSubview(iv)
        iv.centerY(inView: containerView)
        iv.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 24)
        
        containerView.addSubview(passwordTextField)
        passwordTextField.centerY(inView: containerView)
        passwordTextField.anchor(left: iv.rightAnchor, bottom:  containerView.bottomAnchor, right: containerView.rightAnchor, paddingLeft: 8 , paddingBottom: -2)
        
        let v = UIView()
        v.backgroundColor = .white
        v.setHeight(height: 2)
        containerView .addSubview(v)
        v.anchor(left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingLeft: 10)
    
        containerView.setHeight(height: 50)
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
    
    private let passwordTextField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Password"
        tf.textColor = .white
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let emailTextField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Email"
        tf.textColor = .white
        return tf
    }()
    
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
