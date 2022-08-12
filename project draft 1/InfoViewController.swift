//
//  ViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var lblOrder: UILabel!
    @IBOutlet weak var lblVouchers: UILabel!
    @IBOutlet weak var lblNotifications: UILabel!
    @IBOutlet weak var lblHelp: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblOrder?.layer.cornerRadius = 20
        lblVouchers?.layer.cornerRadius = 20
        lblNotifications?.layer.cornerRadius = 20
        lblHelp?.layer.cornerRadius = 20

    }


}

