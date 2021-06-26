//
//  LoginViewModel.swift
//  MyChat
//
//  Created by Javier Cueto on 26/06/21.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
