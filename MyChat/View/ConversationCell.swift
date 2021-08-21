//
//  ConversationCell.swift
//  MyChat
//
//  Created by Javier Cueto on 21/08/21.
//

import UIKit
import SDWebImage

class ConversationCell: UITableViewCell {
    
    // MARK: -  Properties
    
    var conversation: Conversation? {
        didSet{configure()}
    }
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemBlue
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let timestampLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.text = "2h"
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "spider"
        return label
    }()
    
    private let messageTextLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
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
        profileImageView.setDimensions(height: 50, width: 50)
        profileImageView.layer.cornerRadius = 50 / 2
        
        let stackView = UIStackView(arrangedSubviews: [usernameLabel,messageTextLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.centerY(inView: profileImageView)
        stackView.anchor(left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft:  12, paddingRight: 16)
        
        addSubview(timestampLabel)
        timestampLabel.anchor(top: topAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 12)
    }
    
    private func configure(){
        guard let conversation = conversation else{return}
        let viewModel = ConversationViewModel(conversation: conversation)
        messageTextLabel.text = conversation.message.text
        usernameLabel.text = conversation.user.username
        timestampLabel.text = viewModel.timestamp
        profileImageView.sd_setImage(with: viewModel.profileImageUrl, completed: nil)
        
    }
    
    
    
    
    // MARK: -  Actions
   
}
