//
//  MainViewController.swift
//  EasyTask
//
//  Created by Burim on 09/11/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

var myIndex = 0
var tasksList = [Tasks]()



class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self as? UITableViewDataSource
        loadTasks()
        // Do any additional setup after loading the view.
    }
    
    func loadTasks() {
        Database.database().reference().child("tasks").observe(.childAdded) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let titleText = dict["title"] as! String
                let descriptionText = dict["description"] as! String
                let paymentText = dict["payment"] as! String
                let task = Tasks(titleText: titleText, descriptionText: descriptionText, paymentText: paymentText)
                tasksList.append(task)
                self.tableView.reloadData()
            }
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutClick(_ sender: UIButton) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "segueLogOut", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MainViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = tasksList[indexPath.row].title
        cell.detailTextLabel?.text = tasksList[indexPath.row].description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myIndex = indexPath.row
        self.performSegue(withIdentifier: "segueTableView", sender: self)
    }
}
