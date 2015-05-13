//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Mateusz Nadolski on 06/05/15.
//  Copyright (c) 2015 Tooploox. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet private weak var firstNameLabel: UILabel!
    @IBOutlet private weak var lastNameLabel: UILabel!
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    
    private let watchKitDataManager = WatchKitDataManager()
    
    var contact: Contact?
    
    // MARK: - UIViewController
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        sendContact()
    }
    
    // MARK: - Private
    
    private func setupView() {
        if let contact = contact {
            firstNameLabel.text = contact.firstName
            lastNameLabel.text = contact.lastName
            phoneNumberLabel.text = contact.phoneNumber
        }
    }
    
    private func sendContact() {
        if let contact = contact {
            watchKitDataManager.sendContact(contact)
        }
    }
}