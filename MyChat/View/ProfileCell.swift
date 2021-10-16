//
//  ProfileCell.swift
//  MyChat
//
//  Created by Javier Cueto on 09/10/21.
//

import UIKit

class ProfileCell: UITableViewCell {
    // MARK: -  Properties
    var viewModel: ProfileViewModel? {
        didSet{
            configureData()
        }
    }
    private lazy var iconView: UIView = {
        let view = UIView()
        
        view.addSubview(iconImage)
        iconImage.centerY(inView: view)
        iconImage.centerX(inView: view)
        view.backgroundColor = .systemBlue
        view.setDimensions(height: 40, width: 40)
        view.layer.cornerRadius = 40 / 2
        return view
    }()
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(height: 28, width: 28)
        iv.tintColor = .white
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    // MARK: -  Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stack = UIStackView(arrangedSubviews: [iconView, titleLabel])
        stack.spacing = 8
        stack.axis = .horizontal
        
        
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -  Helpers
    func configureData(){
        guard let viewModel = viewModel else {return}
        titleLabel.text = viewModel.description
        iconImage.image = UIImage(systemName: viewModel.iconImageName)
    }
    
    // MARK: -  Actions
}
