//
//  SignUpViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var emailtxt: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    @IBOutlet weak var confirmpasswordtxt: UITextField!
    
    
    @IBOutlet weak var signupview: UIView!
    
    @IBOutlet weak var signupbtn: UIButton!
    
    
    
   
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
    // var users: [UserInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupview.layer.cornerRadius = 20
        signupbtn.layer.cornerRadius = 20
        hideKeyboardWhenTappedAround()
        //fetchInfo()
    }
    //func fetchInfo(){
    //    self.users = try! context.fetch(UserInfo.fetchRequest())
    //}
    

    
    @IBAction func signupbtn(_ sender: Any) {
        if nametxt.text == "" || emailtxt.text == "" || passwordtxt.text == "" || confirmpasswordtxt.text == ""
           {
               let alert = UIAlertController(title: "ERROR", message: "It's mandatorty to enter all the fields", preferredStyle: .alert)

               let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
               let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.view.tintColor = UIColor.red
               alert.addAction(ok)
               alert.addAction(cancel)

               self.present(alert, animated: true, completion: nil)

           }

           else if (passwordtxt.text != confirmpasswordtxt.text)
           {
               let alert = UIAlertController(title: "ERROR", message: "Password does not match", preferredStyle: .alert
               )

               let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
               let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.view.tintColor = UIColor.red
               alert.addAction(ok)
               alert.addAction(cancel)

               self.present(alert, animated: true, completion: nil)

           }

           else
           {
               let new_user = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: context)

               new_user.setValue(nametxt.text, forKey: "username")
               new_user.setValue(emailtxt.text, forKey: "email")
               new_user.setValue(passwordtxt.text, forKey: "password")

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

       let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
       if let HomeViewController = (story.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController) {
       
            self.present(HomeViewController, animated: true, completion: nil)
          //self.show(TabVC, sender: nil)
            self.modalPresentationStyle = .fullScreen
            self.modalTransitionStyle = .crossDissolve
        

        }

           }
    
       }
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    
