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
    }
    
    // MARK: -  Helpers
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
        configureNavigationBar(withTitle: "Message", prefersLargeTitles: true)
        
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
    func authenticationUser(){
        if Auth.auth().currentUser?.uid == nil {
            presentLoginScreen()
        }else{
            print("debug: user is logged in. Configure controller")
        }
    }
}

extension ConversationController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ConversationController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}

extension ConversationController: NewMessageControllerDelegate {
    func controller(_ controller: NewMessageController, wantsToStartChatWith user: User) {
        controller.dismiss(animated: false, completion: nil)
        let chat = ChatController(user: user)
        navigationController?.pushViewController(chat, animated: true)
    }
    
}
