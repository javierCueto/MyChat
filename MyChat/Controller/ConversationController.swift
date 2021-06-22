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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleShowBotton))
    }
    
    
    // MARK: -  Actions
    
    @objc func handleShowBotton(){
        print("123tamarindo")
    }
}
