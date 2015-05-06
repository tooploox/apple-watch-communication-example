//
//  WatchKitDataManager.swift
//  Contacts
//
//  Created by Mateusz Nadolski on 06/05/15.
//  Copyright (c) 2015 Tooploox. All rights reserved.
//

import Foundation

class WatchKitDataManager: NSObject {
    
    let contactClassName = "contact"
    
    let wormhole = MMWormhole(applicationGroupIdentifier:"group.com.tooploox.contacts", optionalDirectory:nil)
    
    // MARK: - Public
    
    func sendContact(contact: Contact) {
        NSKeyedArchiver.setClassName(contactClassName, forClass:Contact.self)
        wormhole.passMessageObject(contact, identifier: contactClassName)
    }
    
    func readVideos() -> Contact? {
        NSKeyedUnarchiver.setClass(Contact.self, forClassName:contactClassName)
        if let unwrappedContact = wormhole.messageWithIdentifier(contactClassName) as? Contact {
            return unwrappedContact
        }
        return nil
    }
}
