//
//  User.swift
//  MyChat
//
//  Created by Javier Cueto on 31/07/21.
//

import Foundation

struct User {
    let uid: String
    let profileImageUrl: String
    let email: String
    let username: String
    let fullname: String
    
    init(dictionary: [String: Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
    }
}
