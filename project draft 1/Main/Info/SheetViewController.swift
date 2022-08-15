//
//  SheetViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/15/22.
//

import UIKit

class SheetViewController: UIViewController {

    @IBOutlet weak var itemimg: UIImageView!
    
    @IBOutlet weak var nametxt: UILabel!
    
    @IBOutlet weak var pricetxt: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var steppervalue: UILabel!
    
    @IBOutlet weak var sheetview: UIView!
        
    
    @IBOutlet weak var addcartbtn: UIButton!
    
    @IBOutlet weak var continuebtn: UIButton!
    
    @IBOutlet weak var cancelbtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        sheetview.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
