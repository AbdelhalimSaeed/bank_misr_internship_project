//
//  UserInfo+CoreDataProperties.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension UserInfo : Identifiable {

}
