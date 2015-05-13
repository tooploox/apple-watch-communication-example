//
//  ContactInterfaceController.swift
//  Contacts
//
//  Created by Mateusz Nadolski on 06/05/15.
//  Copyright (c) 2015 Tooploox. All rights reserved.
//

import WatchKit
import Foundation

class ContactInterfaceController: WKInterfaceController, WatchKitDataManagerDelegate {
    
    @IBOutlet private weak var firstNameLabel: WKInterfaceLabel!
    @IBOutlet private weak var lastNameLabel: WKInterfaceLabel!
    @IBOutlet private weak var phoneNumberLabel: WKInterfaceLabel!
    
    private let watchKitDataManager = WatchKitDataManager()
    
    // MARK: - WKInterfaceController
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        readContact()
        setupListener()
    }
    
    // MARK: - Private
    
    private func readContact() {
        if let contact = watchKitDataManager.readContact() {
            setupViewWithContact(contact)
        }
    }
    
    private func setupListener() {
        watchKitDataManager.delegate = self
        watchKitDataManager.startListeningForContactUpdates()
    }
    
    private func setupViewWithContact(contact: Contact) {
        firstNameLabel.setText(contact.firstName)
        lastNameLabel.setText(contact.lastName)
        phoneNumberLabel.setText(contact.phoneNumber)
    }
    
    // MARK: - WatchKitDataManagerDelegate
    
    func watchKitDataManagerDidUpdateContact(watchKitDataManager: WatchKitDataManager, contact: Contact) {
        setupViewWithContact(contact)
    }
}