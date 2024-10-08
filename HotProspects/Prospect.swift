//
//  Prospect.swift
//  HotProspects
//
//  Created by Anthony Candelino on 2024-09-24.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var dateAdded: Date
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.dateAdded = Date.now
    }
}
