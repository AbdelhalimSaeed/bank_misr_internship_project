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
    @IBOutlet weak var steppervalue: UILabel!
    @IBOutlet weak var sheetview: UIView!
    @IBOutlet weak var addcartbtn: UIButton!
    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var cancelbtn: UIButton!
    
    
    
    @IBAction func stepper(_ sender: UIStepper) {
        steppervalue.text = String(sender .value)
    }
    
    
    @IBAction func cancelbtn(_ sender: UIButton){
        sender.isSelected  = !sender.isSelected
        if (sender.isSelected)
        {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func continuebtn(_ sender: UIButton){
        sender.isSelected  = !sender.isSelected
        if (sender.isSelected)
        {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func addcartbtn(_ sender: UIButton){
        let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        sender.isSelected  = !sender.isSelected
        if (sender.isSelected)
        {
            let cartvc = story.instantiateViewController(identifier: "CartViewController") as! CartViewController
            
// here we pass information form action sheet to cart which is in another storyboard if the button is pressed
            
            self.present(cartvc, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sheetview.layer.cornerRadius = 20
        
        

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
