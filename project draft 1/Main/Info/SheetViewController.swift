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
        selected!.boughtItemsCount=Int64(sender.value)
        steppervalue.text = String(Int64(sender .value))
        pricetxt.text=String(selected!.price*sender.value)
    }
    
    
    @IBAction func cancelbtn(_ sender: UIButton){
        let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            let home = story.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
              self.present(home, animated: true, completion: nil)
    }
    
    
    
    @IBAction func continuebtn(_ sender: UIButton){
        sender.isSelected  = !sender.isSelected
        if (sender.isSelected)
        {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func addcartbtn(_ sender: UIButton){
        if !cart.isEmpty
        {
            if(!cart.contains(selected!)){
               cart.append(selected!)
               selected!.isAddedToCart=true
        }
            else{
                var i=0
                while i<8{
                    if(cart[i].name!==selected!.name!){
                        cart[i].price=selected!.price
                    }
                }
            }
    
        } else{
               cart.append(selected!)
               selected!.isAddedToCart=true
        
        }
        print(cart.count)
        
       
        let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            let home = story.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
              self.present(home, animated: true, completion: nil)
        
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
