//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Mateusz Nadolski on 05/05/15.
//  Copyright (c) 2015 Tooploox. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController, NewContactViewControllerDelegate {
    
    private let contactTableViewCellIdentifier = "ContactTableViewCell"
    private let createNewContactViewControllerSegueIdentifier = "ShowCreateNewContactViewController"
    
    private var contacts = [Contact]()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private
    
    private func setupView() {
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count(contacts)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var contactCell = tableView.dequeueReusableCellWithIdentifier(contactTableViewCellIdentifier, forIndexPath: indexPath) as! ContactTableViewCell
        contactCell.setupWithContact(contacts[indexPath.row])
        return contactCell
    }
    
    // MARK: - NewContactViewControllerDelegate
    
    func newContactViewControllerDidCreateContact(newContactViewController: NewContactViewController, contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let newContactViewController = segue.destinationViewController as? NewContactViewController where segue.identifier == createNewContactViewControllerSegueIdentifier {
            newContactViewController.delegate = self
        }
    }
}