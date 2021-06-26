//
//  RegistrationController.swift
//  MyChat
//
//  Created by Javier Cueto on 22/06/21.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: -  Properties
    
    //change to button
    private let imagePerfilButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.setDimensions(height: 120, width: 120)
        button.addTarget(self, action: #selector(handleLoadImage), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainer: InputContainerView = {
        let i = InputContainerView(image: UIImage(systemName: "envelope")!, textField: emailTextfield)
        return i
    }()
    private let emailTextfield = CustomTextFIeld(placeholder: "Email")
    
    private lazy var fullNameContainer: InputContainerView = {
        let i = InputContainerView(image: UIImage(systemName: "person")!, textField: fullNameTextfield)
        return i
    }()
    private let fullNameTextfield = CustomTextFIeld(placeholder: "Full name")
    
    private lazy var userNameContainer: InputContainerView = {
        let i = InputContainerView(image: UIImage(systemName: "person")!, textField: userNameTextfield)
        return i
    }()
    private let userNameTextfield = CustomTextFIeld(placeholder: "User Name")
    
    private lazy var passwordContainer: InputContainerView = {
        let i = InputContainerView(image: UIImage(systemName: "lock")!, textField: passwordTextfield)
        return i
    }()
    private let passwordTextfield = CustomTextFIeld(placeholder: "Password")
    
    
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
    
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Do you have an account? ", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor : UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor : UIColor.white]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        button.addTarget(self, action: #selector(handleAlreadyAccount), for: .touchUpInside)
        return button
    }()
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configureUI()
    }
    
    // MARK: -  Helpers
    func configureUI(){
        configureImage()
        configureDontHaveAccount()
        configureInputs()
    }
    
    func configureImage(){
        view.addSubview(imagePerfilButton)
        imagePerfilButton.centerX(inView: view)
        imagePerfilButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 10)
    }
    
    func configureInputs(){
        let stack = UIStackView(arrangedSubviews: [emailContainer,fullNameContainer,userNameContainer,passwordContainer,loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: imagePerfilButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    func configureDontHaveAccount(){
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10)
    }
    
    
    // MARK: -  Actions
    
    @objc func handleAlreadyAccount(){
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func handleLoadImage(){
        
        
    }
}
