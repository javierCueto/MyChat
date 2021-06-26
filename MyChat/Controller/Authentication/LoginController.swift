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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setHeight(height: 50)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.tintColor = .white
        return button
    }()
    
    private let passwordTextField = CustomTextFIeld(placeholder: "Password", isSecure: true)
    
    private let emailTextField = CustomTextFIeld(placeholder: "Email")
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don´t have an account? ", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor : UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor : UIColor.white]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        button.addTarget(self, action: #selector(handleNewAccount), for: .touchUpInside)
        return button
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
        configureInputs()
        configureDontHaveAccount()
        
      
    }
    
    
    func configureIcon(){
        view.addSubview(iconImage)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 15 ,width: 120, height: 120)
        iconImage.centerX(inView: view)
    }
    
    func configureInputs(){
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    func configureDontHaveAccount(){
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10)
    }
    
 
    // MARK: -  Actions
    @objc func handleNewAccount(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}
