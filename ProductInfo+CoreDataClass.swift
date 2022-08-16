//
//  ProductInfo+CoreDataClass.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/15/22.
//
//

import Foundation
import CoreData

@objc(ProductInfo)
public class ProductInfo: NSManagedObject {
    
}
func addItems(){
let newProduct = ProductInfo(context: context)
   //first meal
   newProduct.name = "Heart Beef"
   newProduct.price = 15
   newProduct.image = "i3"
   newProduct.isAddedToCart = false
   newProduct.boughtItemsCount = 0
   newProduct.desc = "Well-Done Grilled Steak combined with fried onion rings and grilled tomatoes."
   
   let newProduct2 = ProductInfo(context: context)
   //second meal
   newProduct2.name = "Smoked Salmon"
   newProduct2.price = 20
   newProduct2.image = "i5"
   newProduct2.isAddedToCart = false
   newProduct2.boughtItemsCount = 0
   newProduct2.desc = "Smoked Salmon with butter on top combined with grilled vegetables (red pepper, parsely, brocolli)."

   let newProduct3 = ProductInfo(context: context)
   //third meal
   newProduct3.name = "Chimichurri Chicken"
   newProduct3.price = 13
   newProduct3.image = "i6"
   newProduct3.isAddedToCart = false
   newProduct3.boughtItemsCount = 0
   newProduct3.desc = "Chmichurri Chicken breasts combined with rice and poached vegetables."

   let newProduct4 = ProductInfo(context: context)
   //fourth meal
   newProduct4.name = "Steak"
   newProduct4.price = 14.5
   newProduct4.image = "i2"
   newProduct4.isAddedToCart = false
   newProduct4.boughtItemsCount = 0
   newProduct4.desc = "Medium-Done Grilled Steak with grated parsley and olive oil on top ."

   let newProduct5 = ProductInfo(context: context)
   //fifth meal
   newProduct5.name = "Shrimps"
   newProduct5.price = 18
   newProduct5.image = "i4"
   newProduct5.isAddedToCart = false
   newProduct5.boughtItemsCount = 0
   newProduct5.desc = "Shrimps with pasta with vegetbes and peanuts on top."

   let newProduct6 = ProductInfo(context: context)
   //sixth meal
   newProduct6.name = "Chicken Teriyaki"
   newProduct6.price = 10
   newProduct6.image = "i8"
   newProduct6.isAddedToCart = false
   newProduct6.boughtItemsCount = 0
   newProduct6.desc = "Teriyaki Chicken with white rice."

   let newProduct7 = ProductInfo(context: context)
   //seventh meal
   newProduct7.name = "Beef Teriyaki"
   newProduct7.price = 12
   newProduct7.image = "i7"
   newProduct7.isAddedToCart = false
   newProduct7.boughtItemsCount = 0
   newProduct7.desc = "Plate of Teriyaki meat with vegetables."

   let newProduct8 = ProductInfo(context: context)
   //eighth meal
   newProduct8.name = "Mango Chicken Teryiaki"
   newProduct8.price = 12
   newProduct8.image = "i9"
   newProduct8.isAddedToCart = false
   newProduct8.boughtItemsCount = 0
   newProduct8.desc = "Plate of Mango Teryiaki Chicken with rice."
   do
       {
               try context.save()
           items = try  context.fetch(ProductInfo.fetchRequest())
           print("products count = \(items.count)")
       } catch { }
   print(items.count)
   
}

