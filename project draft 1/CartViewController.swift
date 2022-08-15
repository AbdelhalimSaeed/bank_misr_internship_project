//
//  CartViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit

class CartViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var gobackbtn: UIButton!
    @IBOutlet weak var paynowbtn: UIButton!
    @IBOutlet weak var carttabel: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gobackbtn.layer.cornerRadius = 20
        paynowbtn.layer.cornerRadius = 20
        
        
        carttabel.dataSource = self
        carttabel.delegate = self
    }
    
    
    let cartarray = Array(repeating: "Item", count: 10)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.cartarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartcell", for: indexPath)
        cell.textLabel?.text = self.cartarray[indexPath.row]
        return cell
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
