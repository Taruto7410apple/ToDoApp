//
//  ViewController.swift
//  ToDoApp
//
//  Created on 2021/02/15.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet var table:UITableView!
    
    var titleArray = [String]()
    var dateStringArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource=self
        table.delegate = self
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateStringArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text=titleArray[indexPath.row]
        cell?.detailTextLabel?.text=dateStringArray[indexPath.row]
        
        return cell!
    }
    
    @IBAction func myUnwindAction(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController){
        if(unwindSegue.identifier=="back"){
            titleArray = UserDefaults.standard.array(forKey:"title")as! [String]
            dateStringArray = UserDefaults.standard.array(forKey:"date")as! [String]
            table.reloadData()
        }
        
    }


}

