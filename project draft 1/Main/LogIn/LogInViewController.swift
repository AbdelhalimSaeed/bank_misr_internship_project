//
//  LogInViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit
import CoreData
var user: UserInfo?
class LogInViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var usernametxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var loginview: UIView!
    
    var result = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginbtn.layer.cornerRadius = 20
        loginview.layer.cornerRadius = 20
        hideKeyboardWhenTappedAround()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    let story = UIStoryboard(name: "HomeStoryboard", bundle: nil)
    @IBAction func loginButton(_ sender: Any) {
        if usernametxt.text == "" || passwordtxt.text == ""
            {
                let alert = UIAlertController(title: "ERROR", message: "You must fillin all the fields", preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                alert.view.tintColor = UIColor.red
                alert.addAction(ok)
                alert.addAction(cancel)

                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                self.CheckForUserNameAndPasswordMatch(username : usernametxt.text! as String, password : passwordtxt.text! as String)
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
                        user=objectentity
                        print("Login Succesfully")
                        
                        if let HomeViewController = (story.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController) {
                               
                            self.present(HomeViewController, animated: true, completion: nil)
                            //self.show(TabVC, sender: nil)
                            self.modalPresentationStyle = .fullScreen
                            self.modalTransitionStyle = .crossDissolve

                        }
                        
                        
                        
                        
                    }else if (objectentity.username == username && objectentity.password != password) || (objectentity.username != username && objectentity.password == password) || (objectentity.username != username && objectentity.password != password)
                    {

                        let alert = UIAlertController(title: "ERROR", message: "User not found", preferredStyle: .alert)

                        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                        alert.view.tintColor = UIColor.red
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
