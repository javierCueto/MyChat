//
//  ConversationController.swift
//  MyChat
//
//  Created by Javier Cueto on 21/06/21.
//

import UIKit
import Firebase
private let reuseIdentifier = "ConversationCell"

class ConversationController: UIViewController {
    // MARK: -  Properties
    private let tableView = UITableView()
    private var conversations = [Conversation]()
    
    private let newMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.imageView?.setDimensions(height: 24, width: 24)
        button.addTarget(self, action: #selector(handleNewMessage), for: .touchUpInside)
        return button
    }()
    
    
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchConversations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar(withTitle: "Message", prefersLargeTitles: true)
    }
    
    // MARK: -  Helpers
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.register(ConversationCell.self, forCellReuseIdentifier: reuseIdentifier)
        //clear none cells
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.frame = view.frame
    }
    
    
    func configureUI(){
        view.backgroundColor = .white
        
        configureNavigationBar()
        authenticationUser()
        configureTableView()
        configureNewMessage()
        
        
    }
    
    func configureNavigationBar(){
        
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleShowBotton))
    }
    
    func configureNewMessage(){
        view.addSubview(newMessageButton)
        newMessageButton.setDimensions(height: 56, width: 56)
        newMessageButton.layer.cornerRadius = 56 / 2
        newMessageButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right:  view.rightAnchor, paddingBottom: 20, paddingRight: 20)
    }
    
    
    func logout(){
        do{
            try Auth.auth().signOut()
            presentLoginScreen()
        }catch {
            print("error")
        }
    }
    
    func presentLoginScreen(){
        DispatchQueue.main.async {
            let controller = LoginController()
           //controller.modalPresentationStyle = .fullScreen
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    func showChatController(forUser user: User){
        let controller = ChatController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
    // MARK: -  Actions
    
    
    @objc func handleShowBotton(){
        logout()
    }
    
    @objc func handleNewMessage(){
        let controller = NewMessageController()
        controller.delegate = self
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    
    
    // MARK: -  API
    func fetchConversations(){
        Service.fetchConversations { conversations in
            self.conversations = conversations
            self.tableView.reloadData()
        }
    }
    
    func authenticationUser(){
        if Auth.auth().currentUser?.uid == nil {
            presentLoginScreen()
        }else{
            print("debug: user is logged in. Configure controller")
        }
    }
}

// MARK: -  UITableViewDelegate
extension ConversationController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = conversations[indexPath.row].user
        showChatController(forUser: user)
    }
}

extension ConversationController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ConversationCell
        cell.conversation = conversations[indexPath.row]
        return cell
    }
}

extension ConversationController: NewMessageControllerDelegate {
    func controller(_ controller: NewMessageController, wantsToStartChatWith user: User) {
        controller.dismiss(animated: false, completion: nil)
        showChatController(forUser: user)
    }
    
}
