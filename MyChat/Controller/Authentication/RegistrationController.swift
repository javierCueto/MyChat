//
//  RegistrationController.swift
//  MyChat
//
//  Created by Javier Cueto on 22/06/21.
//

import UIKit
import Firebase

class RegistrationController: UIViewController {
    // MARK: -  Properties
    private var viewModel = RegisterViewModel()
    private var profileImage : UIImage?
    
    //change to button
    private let imagePerfilButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.setDimensions(height: 200, width: 200)
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
    
    
    private let signButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setHeight(height: 50)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.tintColor = .white
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSign), for: .touchUpInside)
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
    func checkFormStatus(){
        if viewModel.formIsValid {
            signButton.isEnabled = true
            signButton.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        }else{
            signButton.isEnabled = false
            signButton.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
    }
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
        let stack = UIStackView(arrangedSubviews: [emailContainer,fullNameContainer,userNameContainer,passwordContainer,signButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: imagePerfilButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        emailTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    func configureDontHaveAccount(){
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10)
    }
    
    
    // MARK: -  Actions
    
    @objc func handleSign(){
        guard let email = emailTextfield.text else {return}
        guard let fullname = fullNameTextfield.text else {return}
        guard let username = userNameTextfield.text?.lowercased() else {return}
        guard let password = passwordTextfield.text else {return}
        guard let profileImage = profileImage else {return}
        
        let registration = RegistrationCredentials(email: email, username: username, fullname: fullname, password: password, profileImage: profileImage)
        
        AuthServices.shared.createNewUser(registrationCredential: registration) { error in
            if let error = error {
                print("debug: error al guardar datos del usuario - \(error.localizedDescription)")
                return
            }
            print("datos guardados")
            self.dismiss(animated: true, completion: nil)
        }
       
    }
    
    @objc func handleAlreadyAccount(){
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func handleLoadImage(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    @objc func textDidChange(sender: UITextField){
       
        if sender == emailTextfield {
            viewModel.email = sender.text
        }else if sender == passwordTextfield{
            viewModel.password = sender.text
        }else if sender == userNameTextfield {
            viewModel.userName = sender.text
        }else{
            viewModel.fullName = sender.text
        }
        checkFormStatus()
    }
}

// MARK: -  UIImagePickerControllerDelegate
extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        // image validation - move to another function
        profileImage = image
        viewModel.image = profileImage
        checkFormStatus()
        ///
        imagePerfilButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        imagePerfilButton.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        imagePerfilButton.layer.borderWidth = 3.0
        imagePerfilButton.layer.cornerRadius = 200 / 2

        dismiss(animated: true, completion: nil)
        
    }
}
