//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Mateusz Nadolski on 05/05/15.
//  Copyright (c) 2015 Tooploox. All rights reserved.
//

import UIKit

final class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Public
    
    func setupWithFirstName(firstName: String, lastName: String) {
        nameLabel.text = "\(firstName) \(lastName)"
    }
}