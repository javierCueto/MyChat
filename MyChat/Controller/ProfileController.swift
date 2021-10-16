//
//  ProfileController.swift
//  MyChat
//
//  Created by Javier Cueto on 09/10/21.
//

import UIKit
import Firebase

protocol ProfileControllerDelegate: AnyObject{
    func handleLogout()
}

class ProfileController: UITableViewController{
    // MARK: -  Properties
    weak var delegate: ProfileControllerDelegate?
    
    let cellIdentifier = "cellProfile"
    private lazy var height: CGFloat = view.frame.height
    private lazy var width: CGFloat = UIScreen.main.bounds.width
    private let heightHeaderView: CGFloat = 380
    
    private lazy var headerView = ProfileHeader(frame: .init(x: 0, y: 0, width: width, height: heightHeaderView))
    private var footerView = ProfileFooter()
    
    
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
        tableView.register(ProfileCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = 64
        tableView.backgroundColor = .systemGroupedBackground
        footerView.frame = .init(x: 0, y: 0, width: width, height: 100)
        tableView.tableFooterView = footerView
        footerView.delegate = self
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
    
    // MARK: - API
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Service.fetchUser(withUid: uid) { user in
            self.headerView.user = user
        }
    }
}

// MARK: -  UITableVIewDataSource
extension ProfileController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileViewModel.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProfileCell
        let viewModel = ProfileViewModel(rawValue: indexPath.row)
        cell.viewModel = viewModel
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: -  ProfileHeaderDelegate
extension ProfileController : ProfileHeaderDelegate{
    func dismissController() {
        dismiss(animated: true)
    }
}

// MARK: -  ProfileFooterDelegate
extension ProfileController : ProfileFooterDelegate{
    func handleLogout() {
        let alert = UIAlertController(title: nil, message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { _ in
            self.delegate?.handleLogout()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: -  UITableViewDelegate
extension ProfileController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = ProfileViewModel(rawValue: indexPath.row) else {return}
        switch viewModel {
        case .accountInfo:
            debugPrint(viewModel.description)
        case .settings:
            debugPrint(viewModel.description)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}
