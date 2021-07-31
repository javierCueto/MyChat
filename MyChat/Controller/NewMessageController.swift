//
//  NewMessageController.swift
//  MyChat
//
//  Created by Javier Cueto on 25/07/21.
//

import UIKit

private let reuseIdentifier = "UserCell"
class NewMessageController: UITableViewController {
    // MARK: -  Properties
    private var users = [User]()
    
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTable()
        fetchUsers()
    }
    
    // MARK: -  Helpers
    func configureUI(){
        configureNavigationBar(withTitle: "New Message", prefersLargeTitles: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))
    }
    
    func configureTable(){
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
    
    // MARK: -  API
    func fetchUsers(){
        Service.fetchUsers{ users in
            self.users = users
            self.tableView.reloadData()
            
        }
    }
    
    // MARK: -  Actions
    @objc func handleDismissal(){
        
    }
}

// MARK: -  DataSource
extension NewMessageController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users.count)
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        return cell
    }
}
