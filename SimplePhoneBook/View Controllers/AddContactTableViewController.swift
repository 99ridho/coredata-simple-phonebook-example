//
//  AddContactTableViewController.swift
//  SimplePhoneBook
//
//  Created by Muhammad Ridho on 8/9/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import UIKit

class AddContactTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    let dap = PhoneBookDataAccessProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonSaveTapped(_ sender: UIBarButtonItem) {
        // Add guard statment
        
        dap.addPhoneBookData(name: nameTextField.text!, phoneNumber: phoneTextField.text!)
        
        dismiss(animated: true, completion: nil)
    }
}
