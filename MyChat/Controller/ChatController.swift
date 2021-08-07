//
//  ChatController.swift
//  MyChat
//
//  Created by Javier Cueto on 07/08/21.
//

import UIKit

class ChatController: UICollectionViewController {
    // MARK: -  Properties
    let user: User
    
    // MARK: -  Life Cycle
    init(user: User){
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: -  Helpers
    func configureUI(){
        configureUICollection()
    }
    
    func configureUICollection(){
        collectionView.backgroundColor = .white
    }
    
    // MARK: -  Actions
}
