//
//  MineTasksViewController.swift
//  EasyTask
//
//  Created by Burim on 04/12/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

var myIndex2 = 0
var tasksList2 = [Tasks]()
var idList = [String]()

class MineTasksViewController: ViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var burgerMenu: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self as? UITableViewDataSource
        loadTasks()
        tasksList2.removeAll()

        if self.revealViewController() != nil {
            burgerMenu.target = self.revealViewController()
            burgerMenu.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadTasks() {
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("tasks").observe(.childAdded) { (snapshot2: DataSnapshot) in
            let tasksId = snapshot2.key
            idList[myIndex2] = tasksId
            
        Database.database().reference().child("tasks").observe(.childAdded) { (snapshot: DataSnapshot) in
            if (tasksId == snapshot.key){
            if let dict = snapshot.value as? [String: Any] {
                let titleText = dict["title"] as! String
                let descriptionText = dict["description"] as! String
                let paymentText = dict["payment"] as! String
                let task = Tasks(titleText: titleText, descriptionText: descriptionText, paymentText: paymentText)
                tasksList2.append(task)
                self.tableView.reloadData()
            }
            }
            
        }
            }
        }
    }



extension MineTasksViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList2.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditTask", for: indexPath)
        cell.textLabel?.text = tasksList2[indexPath.row].title
        cell.detailTextLabel?.text = tasksList2[indexPath.row].description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myIndex2 = indexPath.row
        self.performSegue(withIdentifier: "segueEditTask", sender: self)
    }
}
