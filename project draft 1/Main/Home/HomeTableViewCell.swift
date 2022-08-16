//
//  HomeTableViewCell.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/15/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    
    
    
    
    @IBOutlet weak var imagee: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    
    
    
    func setupCell( img: UIImage)
    {
        imagee.image = img

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
