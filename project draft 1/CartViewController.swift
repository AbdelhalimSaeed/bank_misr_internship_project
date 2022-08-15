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
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 7
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let Cell = carttabel.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
           Cell.textLabel?.text = "Mario"
           return Cell
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
