//
//  CartTableViewCell.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/15/22.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var dishimage: UIImageView!
    
    @IBOutlet weak var nametxt: UILabel!
    
    @IBOutlet weak var pricetxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func setupCell( img: UIImage, nm: String, pr: String)
    {
        dishimage.image = img
        nametxt.text = nm
        pricetxt.text = pr

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
