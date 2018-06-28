//
//  SecondViewController.swift
//  ToDo
//
//  Created by Tarlan Askaruly on 28.06.2018.
//  Copyright © 2018 Tarlan Askaruly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var nameOf: UITextField!
    
    @IBOutlet weak var hided: UILabel!
    @IBOutlet weak var Picker: UIDatePicker!
    @IBOutlet weak var rubricOf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func DateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let year = dateFormatter.string(from: sender.date)
        print("\(year)")
        hided.text = "\(String(year))"
    }
    
    @IBAction func btnAddTask_Click(_ sender: UIButton) {
        print("\(rubricOf.text!)")
        taskMgr.addTask(name: nameOf.text!, date: hided.text!, rubric: rubricOf.text!)
        self.view.endEditing(true)
        nameOf.text = ""
        rubricOf.text = ""
        self.tabBarController?.selectedIndex = 0;
    }
    @IBAction func button_Pressed(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}

