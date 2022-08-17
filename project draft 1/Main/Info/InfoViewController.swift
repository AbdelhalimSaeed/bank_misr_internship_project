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
    
    
    @IBAction func goBack(_ sender: UIButton) {
        let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        if let HomeViewController = (story.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController) {
         
             self.present(HomeViewController, animated: true, completion: nil)
    }
    }
    
    @IBAction func logOUT(_ sender: UIButton) {
        items[0].boughtItemsCount=0
        items[1].boughtItemsCount=0
        items[2].boughtItemsCount=0
        items[3].boughtItemsCount=0
        items[4].boughtItemsCount=0
        items[5].boughtItemsCount=0
        items[6].boughtItemsCount=0
        items[7].boughtItemsCount=0
        items[0].isAddedToCart=false
        items[1].isAddedToCart=false
        items[2].isAddedToCart=false
        items[3].isAddedToCart=false
        items[4].isAddedToCart=false
        items[5].isAddedToCart=false
        items[6].isAddedToCart=false
        items[7].isAddedToCart=false
        let story = UIStoryboard(name: "Main", bundle: nil)
        if let welcome = (story.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController) {
         
             self.present(welcome, animated: true, completion: nil)
    }
   
    }
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

