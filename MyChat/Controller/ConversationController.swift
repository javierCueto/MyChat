//
//  ConversationController.swift
//  MyChat
//
//  Created by Javier Cueto on 21/06/21.
//

import UIKit

class ConversationController: UIViewController {
    // MARK: -  Properties
    
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: -  Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        
        configureNavigationBar()
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleShowBotton))
    }
    
    func configureNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .systemBlue
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    
    // MARK: -  Actions
    
    @objc func handleShowBotton(){
        print("123tamarindo")
    }
}
