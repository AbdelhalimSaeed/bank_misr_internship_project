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
    
    
    //var result = NSArray()
    
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
        
        //fetchProduct()
        productsExists()
        
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
    
    func productsExists()
        {
            do
            {   let app = UIApplication.shared.delegate as! AppDelegate
                
                let context = app.persistentContainer.viewContext

                let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductInfo")
                
                
                
                items = try  context.fetch(fetchrequest) as! [ProductInfo]
                if(items.count == 0)
                {
                    let alert = UIAlertController(title: "ERROR", message: "No items avilable", preferredStyle: .alert)

                    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    alert.view.tintColor = UIColor.red
                    alert.addAction(ok)
                    alert.addAction(cancel)

                    self.present(alert, animated: true, completion: nil)                }
                else{
                    fetchProduct()
                }
        } catch  {  }

        }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = maintabel.dequeueReusableCell(withIdentifier: "maincell", for: indexPath) as! HomeTableViewCell
        let product = self.items[indexPath.row]
        //cell.textLabel?.text = product.image
        
        // we need to convert the string to an image
        
        //guard let image = items[UIImagePickerControllerEditedImage] as? UIImage else { return }
        
        cell.setupCell(img: UIImage.init(named: "\(String(describing: img))")!)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = items.[indexPath.row]
            imageView.image = UIImage.init(named: "ImageName")
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

