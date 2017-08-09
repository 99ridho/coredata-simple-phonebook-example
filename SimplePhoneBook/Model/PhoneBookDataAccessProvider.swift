//
//  PhoneBookDataAccessProvider.swift
//  SimplePhoneBook
//
//  Created by Muhammad Ridho on 8/9/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct PhoneBookDataAccessProvider {
    
    private var appDelegate: AppDelegate!
    private var managedObjectContext: NSManagedObjectContext!
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func fetchPhoneBookData() -> [PhoneBookData] {
        let request = PhoneBookData.phoneBookDataFetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            return try managedObjectContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func addPhoneBookData(name: String, phoneNumber: String) {
        let newPhoneBookData = NSEntityDescription.insertNewObject(forEntityName: "PhoneBookData", into: managedObjectContext) as! PhoneBookData
        
        newPhoneBookData.name = name
        newPhoneBookData.phoneNumber = phoneNumber
        
        do {
            managedObjectContext.insert(newPhoneBookData)
            try managedObjectContext.save()
        } catch {
            // do something
        }
    }
    
    func deletePhoneBookData(index: Int) {
        let allData = self.fetchPhoneBookData()
        
        allData.enumerated().forEach { i, element in 
            if i == index {
                managedObjectContext.delete(element)
                do {
                    try managedObjectContext.save()
                } catch {
                    // do something
                }
            }
        }
    }
}
