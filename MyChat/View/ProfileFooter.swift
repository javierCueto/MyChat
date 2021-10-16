//
//  ProfileFooter.swift
//  MyChat
//
//  Created by Javier Cueto on 16/10/21.
//

import UIKit
protocol ProfileFooterDelegate: AnyObject{
    func handleLogout()
}

class ProfileFooter: UIView{
    // MARK: -  Properties
    weak var delegate: ProfileFooterDelegate?
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: -  Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoutButton)
        logoutButton.anchor(left: leftAnchor, right: rightAnchor, paddingLeft: 20, paddingRight: 20)
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.centerY(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  Helpers
    
    
    // MARK: -  Actions
    @objc func handleLogout(){
        delegate?.handleLogout()
    }
}
