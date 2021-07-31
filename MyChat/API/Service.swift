//
//  Service.swift
//  MyChat
//
//  Created by Javier Cueto on 31/07/21.
//

import Firebase

struct Service{
    static func fetchUsers(completion: @escaping([User]) ->Void){
        var users = [User]()
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            snapshot?.documents.forEach({ document in
                let user = User(dictionary: document.data())
                users.append(user)
            })
            completion(users)
        }
    }
}
