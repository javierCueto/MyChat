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
    
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTable()
    }
    
    // MARK: -  Helpers
    func configureUI(){
        configureNavigationBar(withTitle: "New Message", prefersLargeTitles: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))
    }
    
    func configureTable(){
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
    
    // MARK: -  Actions
    @objc func handleDismissal(){
        
    }
}

// MARK: -  DataSource
extension NewMessageController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}
