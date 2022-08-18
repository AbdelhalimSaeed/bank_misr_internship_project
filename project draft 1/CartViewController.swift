//
//  CartViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit

class CartViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{


    @IBOutlet weak var totalprice: UILabel!
    //  @IBOutlet weak var cartcell: Cart1CollectionViewCell!
    
    @IBOutlet weak var carttabel: UICollectionView!
    @IBOutlet weak var gobackbtn: UIButton!
    @IBOutlet weak var paynowbtn: UIButton!
 
   
    
    @IBAction func payNow(_ sender: Any) {
        items[0].boughtItemsCount=0
        items[1].boughtItemsCount=0
        items[2].boughtItemsCount=0
        items[3].boughtItemsCount=0
        items[4].boughtItemsCount=0
        items[5].boughtItemsCount=0
        items[6].boughtItemsCount=0
        items[7].boughtItemsCount=0
        items[0].isAddedToCart=false
        items[1].isAddedToCart=false
        items[2].isAddedToCart=false
        items[3].isAddedToCart=false
        items[4].isAddedToCart=false
        items[5].isAddedToCart=false
        items[6].isAddedToCart=false
        items[7].isAddedToCart=false
        cart=[]
        let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        if let home = (story.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController) {
         
             self.present(home, animated: true, completion: nil)
    }
        
    }
    
    
    @IBAction func gobackbtn(_ sender: UIButton) {
        let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        if let home = (story.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController) {
         
             self.present(home, animated: true, completion: nil)
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carttabel.delegate=self
        carttabel.dataSource=self
        gobackbtn.layer.cornerRadius = 20
        paynowbtn.layer.cornerRadius = 20
        
       
    }
    var select = 0
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !cart.isEmpty{
           return cart.count
        }
        return 0
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cartcell", for: indexPath) as! Cart1CollectionViewCell
            
            cell.setUpCell(im: UIImage(imageLiteralResourceName: cart[indexPath.row].image!), nm: cart[indexPath.row].name!, pr: cart[indexPath.row].price)
            
            
            return cell
          
        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selected!=cart[indexPath.row]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
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

