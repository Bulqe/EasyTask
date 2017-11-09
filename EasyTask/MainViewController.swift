//
//  MainViewController.swift
//  EasyTask
//
//  Created by Burim on 09/11/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var tasksList:[String] = []
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    
    @IBAction func logOutClick(_ sender: UIButton) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "segueLogOut", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = tasksList[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        handle = ref?.child("tasks").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String
            {
                self.tasksList.append(item)
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
