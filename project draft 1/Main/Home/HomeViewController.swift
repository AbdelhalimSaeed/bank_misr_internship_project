//
//  HomeViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//


import Foundation
import UIKit
import CoreData
//var products:[ProductInfo] = []


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate
{
    
    
    var result = NSArray()

    
    @IBOutlet weak var maintabel: UITableView!

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var nametxt: UILabel!
    
    @IBOutlet weak var pricetxt: UIButton!
    
    @IBOutlet weak var descriptiontxt: UILabel!
    
    
    @IBOutlet weak var gotocartbtn: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        maintabel.register(UITableViewCell.self, forCellReuseIdentifier: "maincell")
        
        gotocartbtn.layer.cornerRadius = 35
        img.layer.cornerRadius = 20
        
        maintabel.dataSource = self
        maintabel.delegate = self
        
        
        
        
        
    }
    
    //func CheckForProduct (
    
    
    
/*    @IBAction func didTapButton(){
        present(Cart(), animated: true)
    }*/
    
    
    
    let mainarray = Array(repeating: "Item", count: 10)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.mainarray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "maincell", for: indexPath)
        cell.textLabel?.text = self.mainarray[indexPath.row]
        return cell
    }
    
    
    @IBAction func heartbtn(_ sender: UIButton) {
        if sender.isSelected
        {
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }
    }
    
}

