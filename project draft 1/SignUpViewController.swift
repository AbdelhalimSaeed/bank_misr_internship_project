//
//  SignUpViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfpassword: UITextField!
    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
    // var users: [UserInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupView.layer.cornerRadius = 20
        signupButton.layer.cornerRadius = 20
        //fetchInfo()
    }
    //func fetchInfo(){
    //    self.users = try! context.fetch(UserInfo.fetchRequest())
    //}
    
    @IBAction func terms(_ sender: UIButton
    ) {
        if sender.isSelected
        {
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }
    }
    
    @IBAction func signupButton(_ sender: Any) {
        if txtName.text == "" || txtEmail.text == "" || txtPassword.text == "" || txtConfpassword.text == ""
           {
               let alert = UIAlertController(title: "Information", message: "It's mandatorty to enter all the fields", preferredStyle: .alert)

               let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
               let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.view.tintColor = UIColor.orange
               alert.addAction(ok)
               alert.addAction(cancel)

               self.present(alert, animated: true, completion: nil)

           }

           else if (txtPassword.text != txtConfpassword.text)
           {
               let alert = UIAlertController(title: "Information", message: "Password does not match", preferredStyle: .alert
               )

               let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
               let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.view.tintColor = UIColor.orange
               alert.addAction(ok)
               alert.addAction(cancel)

               self.present(alert, animated: true, completion: nil)

           }

           else
           {
               let new_user = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: context)

               new_user.setValue(txtName.text, forKey: "username")
               new_user.setValue(txtEmail.text, forKey: "email")
               new_user.setValue(txtPassword.text, forKey: "password")

               do
               {
                   try context.save()
                   print("Registered  Sucessfully")
               }
               catch
               {
                   let Fetcherror = error as NSError
                   print("error", Fetcherror.localizedDescription)
               }
           }

           //self.navigationController?.popViewController(animated: true)
     

        
//        let HomeVC = (storyboard?.instantiateViewController(withIdentifier: "TabVC"))! as UIViewController
//        present(HomeVC, animated: true, completion: nil)
    
        if let TabVC = (storyboard!.instantiateViewController(withIdentifier: "TabVC") as? UITabBarController) {
            self.present(TabVC, animated: true, completion: nil)
            //self.show(TabVC, sender: nil)
//            self.modalPresentationStyle = .fullScreen
//            self.modalTransitionStyle = .crossDissolve

        }

           }
    
       }
        
