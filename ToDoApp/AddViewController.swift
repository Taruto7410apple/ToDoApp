//
//  AddViewController.swift
//  ToDoApp
//
//  Created on 2021/02/17.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var titleTextField:UITextField!
    
    @IBOutlet var datePicker:UIDatePicker!
    
    var titleArray = [String]()
    var dateStringArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    @IBAction func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier=="back") {
                if UserDefaults.standard.object(forKey: "title") != nil && UserDefaults.standard.object(forKey: "date") != nil{
                    titleArray = UserDefaults.standard.array(forKey:"title")as! [String]
                    dateStringArray = UserDefaults.standard.array(forKey:"date")as! [String]
                }
                
                let title = titleTextField.text!
                titleArray.append(title)
                UserDefaults.standard.set(titleArray, forKey: "title")
                
                let date = datePicker.date
                dateStringArray.append(dateToString(date: date))
                UserDefaults.standard.set(dateStringArray, forKey: "date")
                
                let vc = segue.destination as! ViewController;
                vc.titleArray=self.titleArray
                vc.dateStringArray = self.dateStringArray
    
            }
        
    }
    
    func dateToString(date:Date) ->String{
        
        let dateFormatter=DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale=Locale(identifier: "ja_JP")
        return dateFormatter.string(from: date)
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
