//
//  ProfileHeader.swift
//  MyChat
//
//  Created by Javier Cueto on 09/10/21.
//

import UIKit
import SDWebImage

protocol ProfileHeaderDelegate: AnyObject {
    func dismissController()
}
class ProfileHeader: UIView{
    // MARK: -  Properties
    var user: User? {
        didSet{
            configureDataView()
        }
    }
    weak var delegate: ProfileHeaderDelegate?
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(handleDissmisal), for: .touchUpInside)
        button.tintColor = .white
        button.imageView?.setDimensions(height: 22, width: 22)
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4.0
        return iv
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "hola"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "hola"
        return label
    }()
    
    
    
    // MARK: -  Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -  Helpers
    
    func configureUI(){
        configureGradientLayer()
        configureComponents()
    }
    
    func configureGradientLayer(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.blue.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0,1]
        layer.addSublayer(gradient)
        gradient.frame = bounds
    }
    
    func configureComponents(){
        addSubview(dismissButton)
        dismissButton.anchor(top: safeAreaLayoutGuide.topAnchor,left: leftAnchor, paddingTop: 10, paddingLeft: 20)
        
        addSubview(profileImageView)
        profileImageView.centerX(inView: self)
        profileImageView.centerY(inView: self)
        profileImageView.setDimensions(height: 200, width: 200)
        profileImageView.layer.cornerRadius = 200 / 2
        
        let stackview = UIStackView(arrangedSubviews: [fullnameLabel,usernameLabel])
        stackview.axis = .vertical
        stackview.alignment = .center
        addSubview(stackview)
        stackview.anchor(top: profileImageView.bottomAnchor,left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,paddingTop: 20, paddingBottom: 20)
    }
    
    func configureDataView(){
        guard let user = user else {return}
        usernameLabel.text = "@" + user.username
        fullnameLabel.text = user.fullname
        guard let url = URL(string: user.profileImageUrl) else {return}
        profileImageView.sd_setImage(with: url, completed: nil)
    }
    
    // MARK: -  Actions
    
    @objc func handleDissmisal(){
        delegate?.dismissController()
    }
}
