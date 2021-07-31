//
//  Service.swift
//  MyChat
//
//  Created by Javier Cueto on 31/07/21.
//

import Firebase

struct Service{
    static func fetchUsers(){
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            snapshot?.documents.forEach({ document in
                
            })
        }
    }
}
