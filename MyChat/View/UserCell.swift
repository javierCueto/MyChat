//
//  UserCell.swift
//  MyChat
//
//  Created by Javier Cueto on 25/07/21.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: -  Properties
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemBlue
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "spider"
        return label
    }()
    
    private let fullnameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "Peter Parker"
        return label
    }()
    
    // MARK: -  Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  Helpers
    func configureUI(){
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        profileImageView.setDimensions(height: 56, width: 56)
        profileImageView.layer.cornerRadius = 56 / 2
        
        let stackView = UIStackView(arrangedSubviews: [usernameLabel,fullnameLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        
        addSubview(stackView)
        stackView.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
       // stackView.anchor(right: rightAnchor)
        
        
    }
    
    
    
    
    // MARK: -  Actions
    
}
