//
//  ConversationViewModel.swift
//  MyChat
//
//  Created by Javier Cueto on 21/08/21.
//

import UIKit

struct ConversationViewModel {
    private let conversation: Conversation
    var profileImageUrl: URL? {
        return URL(string: conversation.user.profileImageUrl)
    }
    
    var timestamp: String {
        let date = conversation.message.timestamp.dateValue()
        let dateFormaterr = DateFormatter()
        dateFormaterr.dateFormat = "hh.mm.aa"
        return dateFormaterr.string(from: date)
    }
    
    init(conversation: Conversation) {
        self.conversation = conversation
    }
}
