//
//  MessageViewModel.swift
//  MyChat
//
//  Created by Javier Cueto on 08/08/21.
//

import UIKit

struct MessageViewModel {
    private let message: Message
    var messageBackgroundColor: UIColor {
        return message.isFromCurrentUser ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : .systemBlue
    }
    
    var messageTextColor: UIColor {
        return message.isFromCurrentUser ? .black : .white
    }
    
    init(message: Message){
        self.message = message
    }
}
