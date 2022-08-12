//
//  LogInViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit
import CoreData

class LogInViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    
    var result = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
        loginView.layer.cornerRadius = 20
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func remember(_ sender: UIButton) {
        if sender.isSelected
        {
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if txtUsername.text == "" || txtPassword.text == ""
            {
                let alert = UIAlertController(title: "ERROR", message: "You must fillin all the fields", preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                alert.view.tintColor = UIColor.orange
                alert.addAction(ok)
                alert.addAction(cancel)

                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                self.CheckForUserNameAndPasswordMatch(username : txtUsername.text! as String, password : txtPassword.text! as String)
            }
        }
        func CheckForUserNameAndPasswordMatch( username: String, password : String)
        {
            let app = UIApplication.shared.delegate as! AppDelegate

            let context = app.persistentContainer.viewContext

            let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")

            let predicate = NSPredicate(format: "username = %@", username)

            fetchrequest.predicate = predicate
            do
            {
                result = try context.fetch(fetchrequest) as NSArray

                if result.count>0
                {
                    let objectentity = result.firstObject as! UserInfo

                    if objectentity.username == username && objectentity.password == password
                    
                    {
                        print("Login Succesfully")
                        let mainVC = (storyboard?.instantiateViewController(withIdentifier: "TabVC"))! as UIViewController
                        present(mainVC, animated: true, completion: nil)
                    }else if (objectentity.username == username && objectentity.password != password) || (objectentity.username != username && objectentity.password == password) || (objectentity.username != username && objectentity.password != password)
                    {

                        let alert = UIAlertController(title: "ERROR", message: "User not found", preferredStyle: .alert)

                        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                        alert.view.tintColor = UIColor.orange
                        alert.addAction(ok)
                        alert.addAction(cancel)
                        self.present(alert, animated: true, completion: nil)

                    }
                    else{
                        print("Wrong")

                    }
                }
            }

            catch
            {
                let fetch_error = error as NSError
                print("error", fetch_error.localizedDescription)
             
            }
        }
}
