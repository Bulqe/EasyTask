//
//  SideMenuViewController.swift
//  EasyTask
//
//  Created by Burim on 04/12/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

var ref:DatabaseReference?
var userStatus = false

class SideMenuViewController: UITableViewController {
    
    @IBOutlet weak var mineOpgaverCell: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("isTaskCreator").observe(.value, with:{ snapshot in
            userStatus = (snapshot.value != nil)
        })
        
        if (userStatus == false){
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myIndex = indexPath.row
        if (myIndex == 4){
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "segueLogOut", sender: self)
        }
    }
}
