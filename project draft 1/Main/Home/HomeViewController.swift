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
var n: [String?] = []
var p: [Double] = []
var i: [String?] = []
var d: [String?] = []
var items: [ProductInfo] = []
var product: ProductInfo?
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate
{

    
    //var result = NSArray()
    
    
    @IBOutlet weak var maintabel: UITableView!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nametxt: UILabel!
    @IBOutlet weak var pricetxt: UILabel!
    @IBOutlet weak var descriptiontxt: UILabel!
    @IBOutlet weak var gotocartbtn: UIButton!
    
    @IBOutlet weak var imagee: UIImageView!
    
    @IBAction func addtocart(_ sender: UIButton) {
        sender.isSelected  = !sender.isSelected
        
        if (sender.isSelected)
        {
            let sheetvc = self.storyboard?.instantiateViewController(identifier: "SheetViewController") as! SheetViewController
            
           // sheetvc.itemimg.image = img.image
           // sheetvc.nametxt.text = nametxt.text
            /*sheetvc.pricetxt.text = String(Int(pricetxt.text) * Int(sheetvc.steppervalue.text))
            
            self.navigationController?.pushViewController(sheetvc, animated: true)*/

        }
        
    }
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if(!productsExists()){
            addItems()
        }
        print(items.count)
        fetchProduct()
        print(items.count)
        n = [items[0].name,items[1].name,items[2].name,items[3].name,items[4].name,items[5].name,items[6].name,items[7].name]
        p = [items[0].price,items[1].price,items[2].price,items[3].price,items[4].price,items[5].price,items[6].price,items[7].price]
        i = [items[0].image,items[1].image,items[2].image,items[3].image,items[4].image,items[5].image,items[6].image,items[7].image]
        d = [items[0].desc,items[1].desc,items[2].desc,items[3].desc,items[4].desc,items[5].desc,items[6].desc,items[7].desc]
        maintabel.register(UITableViewCell.self, forCellReuseIdentifier: "maincell")
        
        gotocartbtn.layer.cornerRadius = 35
        img.layer.cornerRadius = 20
        
        maintabel.dataSource = self
        maintabel.delegate = self
        
        
        
        
    }
    
    //func CheckForProduct (
    
    func fetchProduct(){
        do{
            items = try context.fetch(ProductInfo.fetchRequest())
            DispatchQueue.main.async{
                self.maintabel.reloadData()
            }
       }
        catch{
            
        }
        print("items count")
        print(items.count)
     }
    
    /*func productsExists()
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
*/
    
    func productsExists() -> Bool{
        do{
            items = try context.fetch(ProductInfo.fetchRequest())
            if(items.count==0){
                return false
                
            }
            else{
                return true
            }
            
            
        } catch{}
        return false
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = maintabel.dequeueReusableCell(withIdentifier: "maincell", for: indexPath) as! HomeTableViewCell
        
        cell.imagee.image = UIImage(contentsOfFile: i[indexPath.row]!)      // we need to convert the string to an image
        //guard let image = items[UIImagePickerControllerEditedImage] as? UIImage else { return }
      
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //let image = tableViewData[indexPath.row]
            //imageView.image = UIImage.init(named: "ImageName")
        
        let tableinfo = items[indexPath.row]
        img.image = UIImage.init(named: "\(String(describing: tableinfo.image))")
        nametxt.text = tableinfo.name
        pricetxt.text = String("\(tableinfo.price)")
        descriptiontxt.text = tableinfo.desc
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

