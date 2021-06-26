//
//  RegisterViewModel.swift
//  MyChat
//
//  Created by Javier Cueto on 26/06/21.
//

import Foundation

struct RegisterViewModel: AuthenticationProtocol {
    
    var email: String?
    var fullName: String?
    var userName: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && fullName?.isEmpty == false && userName?.isEmpty == false && password?.isEmpty == false
    }
}
