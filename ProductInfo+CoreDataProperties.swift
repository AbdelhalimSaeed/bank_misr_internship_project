//
//  ProductInfo+CoreDataProperties.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/15/22.
//
//

import Foundation
import CoreData


extension ProductInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductInfo> {
        return NSFetchRequest<ProductInfo>(entityName: "ProductInfo")
    }

    @NSManaged public var boughtItemsCount: Bool
    @NSManaged public var desc: String?
    @NSManaged public var image: String?
    @NSManaged public var isAddedToCart: Bool
    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension ProductInfo : Identifiable {

}
