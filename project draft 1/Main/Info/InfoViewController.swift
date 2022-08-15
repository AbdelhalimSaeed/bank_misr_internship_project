//
//  ViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit

class InfoViewController: UIViewController {


    
    @IBOutlet weak var orderlbl: UILabel!
    
    @IBOutlet weak var voucherlbl: UILabel!
    
    @IBOutlet weak var notificationlbl: UILabel!
    
    @IBOutlet weak var helplbl: UILabel!
    
    
    @IBOutlet weak var logoutbtn: UIButton!
    
    
    @IBOutlet weak var gobackbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        orderlbl?.layer.cornerRadius = 20
        voucherlbl?.layer.cornerRadius = 20
        notificationlbl?.layer.cornerRadius = 20
        helplbl?.layer.cornerRadius = 20
        
        
        logoutbtn.layer.cornerRadius = 20
        gobackbtn.layer.cornerRadius = 20
        
    }
    
    

    

}

