//
//  PhoneBookData+CoreDataProperties.swift
//  SimplePhoneBook
//
//  Created by Muhammad Ridho on 8/9/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import Foundation
import CoreData


extension PhoneBookData {

    @nonobjc public class func phoneBookDataFetchRequest() -> NSFetchRequest<PhoneBookData> {
        return NSFetchRequest<PhoneBookData>(entityName: "PhoneBookData")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}
