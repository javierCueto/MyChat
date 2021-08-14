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
    
    static func uploadMessage(_ message: String, to user: User, completion: ((Error?) -> Void)?){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let data = ["text": message, "fromId": currentUid, "toId" : user.uid, "timestamp": Timestamp(date: Date())] as [String : Any]
        COLLECTION_MESSAGES.document(currentUid).collection(user.uid).addDocument(data: data) { _ in
            COLLECTION_MESSAGES.document(user.uid).collection(currentUid).addDocument(data: data, completion: completion)
        }
    }
}
