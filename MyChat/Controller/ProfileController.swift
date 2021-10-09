//
//  ProfileController.swift
//  MyChat
//
//  Created by Javier Cueto on 09/10/21.
//

import UIKit

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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    // MARK: -  Actions
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
