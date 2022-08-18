//
//  Cart1CollectionViewCell.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/17/22.
//

import UIKit

class Cart1CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pricetxt: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var nametxt: UILabel!
    
    @IBAction func cancelbtn(_ sender: UIButton) {
        let i=0
         let c=cart.count
         while i<c{
             if(selected!.name!==cart[i].name!){
                 selected!.isAddedToCart=false
                 selected!.boughtItemsCount=1
                 cart.remove(at: i)
             }
         }
        
    }
    func setUpCell(im: UIImage, nm: String, pr: Double){
        imageV.image=im
        nametxt.text=nm
        pricetxt.text=String(pr)
        
    }
    
}
