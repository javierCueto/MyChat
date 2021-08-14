//
//  ChatController.swift
//  MyChat
//
//  Created by Javier Cueto on 07/08/21.
//

import UIKit
private let reuseIdentifier = "MessageCell"

class ChatController: UICollectionViewController {
    // MARK: -  Properties
    let user: User
    private var messages = [Message]()
    var fromCurrentUser = false
    
    private lazy var customInputView: CustomInputAccessoryView = {
        let iv = CustomInputAccessoryView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        iv.delegate = self
        return iv
    }()
    
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
    
    override var inputAccessoryView: UIView?{
        get { return customInputView}
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK: -  Helpers
    func configureUI(){
        configureUICollection()
        configureNavigationBar(withTitle: user.username, prefersLargeTitles: false)
    }
    
    func configureUICollection(){
        collectionView.backgroundColor = .white
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.alwaysBounceVertical = true
    }
    
    // MARK: -  Actions
}

extension ChatController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MessageCell
        cell.message = messages[indexPath.row]
        return cell
    }
}

extension ChatController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 16, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}

extension ChatController: CustomInputAccessoryViewDelegate{
    func inputView(_ inputView: CustomInputAccessoryView, wantsToSend message: String) {
  
        //fromCurrentUser.toggle()
        //let message = Message(text: message, isFromCurrentUser: fromCurrentUser)
       // messages.append(message)
        //collectionView.reloadData()
        Service.uploadMessage(message, to: user) { error in
            if let error = error {
                print("error in saving messages \(error.localizedDescription)")
                return
            }
            inputView.messageInputTextView.text = nil
            
        }
    }
    
    
}

