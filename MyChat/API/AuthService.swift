//
//  AuthService.swift
//  MyChat
//
//  Created by Javier Cueto on 02/07/21.
//

import Firebase




struct AuthServices {
    static let shared = AuthServices()
    
    func logIn(email: String, password: String, completion: AuthDataResultCallback?){
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func createNewUser(registrationCredential: RegistrationCredentials, completion: ((Error?) -> Void)? ){
        
        guard let imageData = registrationCredential.profileImage.jpegData(compressionQuality: 0.3) else {return}
        
        let filename = NSUUID().uuidString
        
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { meta, error in
            if let error = error {
                print("debug: error al cargar imagen - \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                guard let profileImageURL = url?.absoluteString else {return}
                
                Auth.auth().createUser(withEmail: registrationCredential.email, password: registrationCredential.password) { auth, error in
                    if let error = error {
                        print("debug: error en el login - \(error.localizedDescription)")
                        return
                    }
                    
                    guard let uid = auth?.user.uid else {return}
                    
                    let data = ["email" : registrationCredential.email, "fullname": registrationCredential.fullname, "profileImageUrl" : profileImageURL, "uud": uid, "username": registrationCredential.username] as [String : Any]
                    
                    
                    Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
                    
                    
                }
            }
        }
        
    }
    
    
}
