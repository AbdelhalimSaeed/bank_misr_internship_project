//
//  WelcomeViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/14/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var loginbtn: UIButton!
    
    @IBOutlet weak var signupbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginbtn.layer.cornerRadius = 20
        signupbtn.layer.cornerRadius = 20
    }
    
}
