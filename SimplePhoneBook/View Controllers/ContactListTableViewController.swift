//
//  ContactListTableViewController.swift
//  SimplePhoneBook
//
//  Created by Muhammad Ridho on 8/9/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {

    var phoneBookData: [PhoneBookData] = []
    let phoneBookDataAccessProvider = PhoneBookDataAccessProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refreshPhoneBookData()
        print("hello!!!!")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("aku ngilang rek")
    }
    
    private func refreshPhoneBookData() {
        phoneBookData = phoneBookDataAccessProvider.fetchPhoneBookData()
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.phoneBookData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact_cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.phoneBookData[indexPath.row].name

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            self.phoneBookDataAccessProvider.deletePhoneBookData(index: indexPath.row)
            
            self.refreshPhoneBookData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
