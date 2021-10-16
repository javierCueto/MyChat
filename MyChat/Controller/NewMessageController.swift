//
//  NewMessageController.swift
//  MyChat
//
//  Created by Javier Cueto on 25/07/21.
//

import UIKit

private let reuseIdentifier = "UserCell"
protocol NewMessageControllerDelegate: AnyObject {
    func controller (_ controller: NewMessageController, wantsToStartChatWith user: User)
}
class NewMessageController: UITableViewController {
    // MARK: -  Properties
    private var users = [User]()
    private var filteredUsers = [User]()
    weak var delegate: NewMessageControllerDelegate?
    private let searchController = UISearchController(searchResultsController: nil)
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTable()
        fetchUsers()
        configureSearchController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: -  Helpers
    func configureUI(){
        configureNavigationBar(withTitle: "New Message", prefersLargeTitles: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))
    }
    
    func configureSearchController(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.showsCancelButton = false
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search for user"
        definesPresentationContext = false
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .systemBlue
            textField.backgroundColor = .white
        }
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
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: -  DataSource
extension NewMessageController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredUsers.count : users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        cell.user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        return cell
    }
}

// MARK: -  didSelectRowAt
extension NewMessageController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = inSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        delegate?.controller(self, wantsToStartChatWith: user)
    }
}

// MARK: -  search

extension NewMessageController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else {return}
        filteredUsers = users.filter({ user -> Bool in
            return user.username.contains(searchText) || user.fullname.contains(searchText)
            
        })
        
        self.tableView.reloadData()
        
    }
    
    
}
