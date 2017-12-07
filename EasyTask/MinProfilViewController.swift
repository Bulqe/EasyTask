//
//  MinProfilViewController.swift
//  EasyTask
//
//  Created by Burim on 04/12/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

class MinProfilViewController: ViewController {

    @IBOutlet weak var burgerMenu: UIBarButtonItem!
    @IBOutlet weak var navnLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var postNummerLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var mobilNummerLabel: UILabel!
    
        var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            burgerMenu.target = self.revealViewController()
            burgerMenu.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        ref = Database.database().reference()
        
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("name").observe(.value, with:{ snapshot in
            self.navnLabel.text = snapshot.value as? String
        })
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("address").observe(.value, with:{ snapshot in
            self.adresseLabel.text = snapshot.value as? String
        })
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("zipCode").observe(.value, with:{ snapshot in
            self.postNummerLabel.text = snapshot.value as? String
        })
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("city").observe(.value, with:{ snapshot in
            self.byLabel.text = snapshot.value as? String
        })
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("phonenumber").observe(.value, with:{ snapshot in
            self.mobilNummerLabel.text = snapshot.value as? String
        })
        
        // Do any additional setup after loading the view.
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
