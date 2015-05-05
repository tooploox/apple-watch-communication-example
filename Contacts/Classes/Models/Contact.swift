//
//  Contact.swift
//  Contacts
//
//  Created by Mateusz Nadolski on 05/05/15.
//  Copyright (c) 2015 Tooploox. All rights reserved.
//

import Foundation

final class Contact: NSObject, NSCoding {
    
    private let firstNameKey = "firstName"
    private let lastNameKey = "lastName"
    private let phoneNumberKey = "phoneNumber"
    
    let firstName: String!
    let lastName: String!
    let phoneNumber: Int!
    
    // MARK: - Initialization
    
    init(firstName: String, lastName: String, phoneNumber: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
    
    // MARK: - NSCoding
    
    init(coder aDecoder: NSCoder) {
        firstName = aDecoder.decodeObjectForKey(firstNameKey) as! String
        lastName = aDecoder.decodeObjectForKey(lastNameKey) as! String
        phoneNumber = aDecoder.decodeObjectForKey(phoneNumberKey) as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: firstNameKey)
        aCoder.encodeObject(lastName, forKey: lastNameKey)
        aCoder.encodeObject(phoneNumber, forKey: phoneNumberKey)
    }
}