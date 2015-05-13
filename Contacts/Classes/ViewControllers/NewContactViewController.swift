//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Mateusz Nadolski on 06/05/15.
//  Copyright (c) 2015 Tooploox. All rights reserved.
//

import UIKit

protocol NewContactViewControllerDelegate: class {
    func newContactViewControllerDidCreateContact(newContactViewController: NewContactViewController, contact: Contact)
}

class NewContactViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    @IBOutlet private weak var createContactButton: UIButton!
    
    weak var delegate: NewContactViewControllerDelegate?
    
    // MARK: - Private
    
    private func refreshCreateContactButtonState() {
        createContactButton.enabled = firstNameTextField.text != "" && lastNameTextField.text != "" && phoneNumberTextField.text != ""
    }
    
    // MARK: - Actions
    
    @IBAction private func firstNameTextFieldEditingChanged(sender: UITextField) {
        refreshCreateContactButtonState()
    }
    
    @IBAction private func lastNameTextFieldEditingChanged(sender: UITextField) {
        refreshCreateContactButtonState()
    }
    
    @IBAction private func phoneNumberTextFieldEditingChanged(sender: UITextField) {
        refreshCreateContactButtonState()
    }
    
    @IBAction private func createButtonPressed(sender: UIButton) {
        let createdContact = Contact(firstName: firstNameTextField.text, lastName: lastNameTextField.text, phoneNumber: phoneNumberTextField.text)
        delegate?.newContactViewControllerDidCreateContact(self, contact: createdContact)
        navigationController?.popViewControllerAnimated(true)
    }
}