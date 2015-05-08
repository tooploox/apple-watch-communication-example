//
//  WatchKitDataManager.swift
//  Contacts
//
//  Created by Mateusz Nadolski on 06/05/15.
//  Copyright (c) 2015 Tooploox. All rights reserved.
//

import Foundation

protocol WatchKitDataManagerDelegate: class {
    func watchKitDataManagerDidUpdateContact(watchKitDataManager: WatchKitDataManager, contact: Contact)
}

class WatchKitDataManager: NSObject {
    
    let contactClassName = "contact"
    
    let wormhole = MMWormhole(applicationGroupIdentifier: "group.tooploox.com.Contacts", optionalDirectory: nil)
    
    weak var delegate: WatchKitDataManagerDelegate?
    
    // MARK: - Public
    
    func sendContact(contact: Contact) {
        NSKeyedArchiver.setClassName(contactClassName, forClass: Contact.self)
        wormhole.passMessageObject(contact, identifier: contactClassName)
    }
    
    func readContact() -> Contact? {
        NSKeyedUnarchiver.setClass(Contact.self, forClassName: contactClassName)
        if let unwrappedContact = wormhole.messageWithIdentifier(contactClassName) as? Contact {
            return unwrappedContact
        }
        return nil
    }
    
    func startListeningForContactUpdates() {
        wormhole.listenForMessageWithIdentifier(contactClassName) { [unowned self] (message) in
            if let contact = message as? Contact {
                self.delegate?.watchKitDataManagerDidUpdateContact(self, contact: contact)
            }
        }
    }
}