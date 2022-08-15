//
//  HomeViewController.swift
//  project draft 1
//
//  Created by Mayar Adel on 8/12/22.
//


import Foundation
import UIKit

class HomeViewController: UIViewController, UITableViewDataSource{
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
    }
/*    @IBAction func didTapButton(){
        present(Cart(), animated: true)
    }*/
    
    @IBOutlet weak var tableView: UITableView!
    let tableViewData = Array(repeating: "Item", count: 10)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.tableViewData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = self.tableViewData[indexPath.row]
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

