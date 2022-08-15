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
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate
{
    
    
    var result = NSArray()
    
    var items: [ProductInfo] = []
   
    
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
        
        fetchProduct()
        
    }
    
    //func CheckForProduct (
    
    func fetchProduct(){
        do{
            self.items = try context.fetch(ProductInfo.fetchRequest())
            DispatchQueue.main.async{
                self.maintabel.reloadData()
            }
       }
        catch{
            
        }
     }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = maintabel.dequeueReusableCell(withIdentifier: "maincell", for: indexPath)
        let product = self.items[indexPath.row]
        cell.textLabel?.text = product.image
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

