//
//  ProfileController.swift
//  MyChat
//
//  Created by Javier Cueto on 09/10/21.
//

import UIKit
import Firebase

class ProfileController: UITableViewController{
    // MARK: -  Properties

    let cellIdentifier = "cellProfile"
    private lazy var height: CGFloat = view.frame.height
    private lazy var width: CGFloat = UIScreen.main.bounds.width
    private let heightHeaderView: CGFloat = 380
    
    private lazy var headerView = ProfileHeader(frame: .init(x: 0, y: 0, width: width, height: heightHeaderView))
    
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUser() 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    // MARK: -  Helpers
    func configureUI(){
        tableView.backgroundColor = .systemBackground
        tableView.tableHeaderView = headerView
        headerView.delegate =  self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    // MARK: -  Actions
    
    // MARK: - API
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Service.fetchUser(withUid: uid) { user in
            self.headerView.user = user
        }
    }
}

extension ProfileController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        return cell
    }
}

extension ProfileController : ProfileHeaderDelegate{
    func dismissController() {
        dismiss(animated: true)
    }
    
    
}
