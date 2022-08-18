//
//  HomeViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//


import Foundation
import UIKit
import CoreData

var n: [String?] = []
var p: [Double] = []
var i: [String?] = []
var d: [String?] = []
var items: [ProductInfo] = []
var cart: [ProductInfo]=[]
var selected: ProductInfo?

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate
{

    
    //var result = NSArray()
    
    @IBOutlet weak var viewInfo: UIButton!
    
   
    
    @IBOutlet weak var gotocartbtn: UIButton!
    
    @IBOutlet weak var maintabel: UITableView!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nametxt: UILabel!
    @IBOutlet weak var pricetxt: UILabel!
    @IBOutlet weak var descriptiontxt: UILabel!
    
    
    @IBOutlet weak var imagee: UIImageView!
   
    @IBAction func addtocart(_ sender: UIButton) {
        sender.isSelected  = !sender.isSelected
        
        let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        if (sender.isSelected)
        {
            let sheetvc = story.instantiateViewController(identifier: "SheetViewController") as! SheetViewController
              self.present(sheetvc, animated: true, completion: nil)
            
            sheetvc.nametxt.text = selected!.name!
            sheetvc.pricetxt.text=String(selected!.price)
            
            //self.navigationController?.pushViewController(sheetvc, animated: true)
        }
        
    }
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        if(!productsExists()){
            addItems()
        }
        selected=items[0]
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
        img.image=UIImage(named:i[0]!)
        nametxt.text=n[0]!
        pricetxt.text=String(p[0])
        descriptiontxt.text=d[0]!
        
        
        
        
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
    
    
    @IBAction func gotocart(_ sender: UIButton) {
        let story = UIStoryboard(name: "CartStoryboard", bundle: nil)
        if let cartvc = (story.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController) {
            if cart.isEmpty{
                cartvc.totalprice.text=String(0)
            }
            else{
                var i=0
                var c=cart.count
                var t=0.0
                while i<c{
                    t+=cart[i].price
               }
                cartvc.totalprice.text=String(t)
            }
            
             self.present(cartvc, animated: true, completion: nil)
    }
    }
    @IBAction func gotoCart(_ sender: UIButton) {
        let story = UIStoryboard(name: "CartStoryboard", bundle: nil)
        if let cartvc = (story.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController) {
            if cart.isEmpty{
                cartvc.totalprice.text=String(0)
            }
            else{
                var i=0
                var c=cart.count
                var t=0.0
                while i<c{
                    t+=cart[i].price
               }
                cartvc.totalprice.text=String(t)
            }
         
             self.present(cartvc, animated: true, completion: nil)
    }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "maincell", for: indexPath) as! UITableViewCell
      //  let imageV=UIImage(i![indexPath.row])
       // cell.setupCell(img: )     // we need to convert the string to an image
        //guard let image = items[UIImagePickerControllerEditedImage] as? UIImage else { return }
       cell.imageView?.image=UIImage(named: i[indexPath.row]!)
      cell.imageView?.frame.size=CGSize(width: 100, height: 100)
      //  cell.imagee.image=UIImage(named: i[indexPath.row]!)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //let image = tableViewData[indexPath.row]
            //imageView.image = UIImage.init(named: "ImageName")
        selected=items[indexPath.row]
        let tableinfo = items[indexPath.row]
        img.image = UIImage(named:i[indexPath.row]!)
        nametxt.text = tableinfo.name
        pricetxt.text = String("\(tableinfo.price)")
        descriptiontxt.text = tableinfo.desc
        }
    

    @IBAction func infoView(_ sender: UIButton) {
        let story = UIStoryboard(name: "InfoStoryboard", bundle: nil)
        if let infos = (story.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController) {
         
             self.present(infos, animated: true, completion: nil)
    }
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

