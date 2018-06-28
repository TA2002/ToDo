//
//  FirstViewController.swift
//  ToDo
//
//  Created by Tarlan Askaruly on 28.06.2018.
//  Copyright © 2018 Tarlan Askaruly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tblTasks: UITableView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var UISearchBar: UISearchBar!
    var filteredData = [String]()
    var isSearching = false
    @IBAction func edit(_ sender: UIButton) {
        tblTasks.isEditing = !tblTasks.isEditing
        
    }
    @IBOutlet weak var myTableView: UITableView!
    let url = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwi3pcmmm_bbAhUL2ywKHe7MAu4QjRx6BAgBEAU&url=https%3A%2F%2Fthenounproject.com%2Fterm%2Fwrong%2F&psig=AOvVaw3cbXCuaOfe_QMlrG_jDH_r&ust=1530270299746521";
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        }
        return  taskMgr.tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var image : UIImage = UIImage(named: "not")!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.imageView?.image = image
        cell.detailTextLabel?.text = "\(taskMgr.tasks[indexPath.row].date)  Rubric: \(taskMgr.tasks[indexPath.row].rubric)"
        return(cell)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            taskMgr.tasks.remove(at: indexPath.row)
            myTableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        let item = taskMgr.tasks[sourceIndexPath.row]
        taskMgr.tasks.remove(at: sourceIndexPath.row)
        taskMgr.tasks.insert(item, at: destinationIndexPath.row)
    }
    override func viewWillAppear(_ animated: Bool) {
        tblTasks.reloadData()
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

