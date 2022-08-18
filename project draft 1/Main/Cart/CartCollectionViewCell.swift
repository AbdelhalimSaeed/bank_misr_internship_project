//
//  CartCollectionView.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/17/22.
//

import Foundation
import UIKit

class CartCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var nametxt: UILabel!
    
    @IBOutlet weak var pricetxt: UILabel!
    func setUpCell(im: UIImage, nm: String, pr: Double){
        imageV.image=im
        nametxt.text=nm
        pricetxt.text=String(pr)
        
    }
    
    @IBAction func cancelbtn(_ sender: UIButton) {
       var i=0
        var c=cart.count
        while i<c{
            if(selected!.name!==cart[i].name!){
                selected!.isAddedToCart=false
                selected!.boughtItemsCount=0
                cart.remove(at: i)
            }
        }
    }
    
}
