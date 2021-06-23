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
    }
    
    func configureIcon(){
        view.addSubview(iconImage)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 15 ,width: 150, height: 150)
        iconImage.centerX(inView: view)
    }
    
 
    // MARK: -  Actions
}
