//
//  EditTaskDoneViewController.swift
//  EasyTask
//
//  Created by Burim on 05/12/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

class EditProfilDoneViewController: ViewController {

    @IBOutlet weak var navnField: UITextField!
    @IBOutlet weak var adresseField: UITextField!
    @IBOutlet weak var postNummerField: UITextField!
    @IBOutlet weak var byField: UITextField!
    @IBOutlet weak var gemButton: UIButton!
    
    var ref:DatabaseReference?
    
    @IBAction func gemButtonClick(_ sender: Any) {
        
        ref = Database.database().reference()
        
        if navnField.text != "" && adresseField.text != "" && postNummerField.text != "" && byField.text != "" {
        
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("name").setValue(self.navnField.text)
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("address").setValue(self.adresseField.text)
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("city").setValue(self.byField.text)
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("zipCode").setValue(self.postNummerField.text)
     
            self.performSegue(withIdentifier: "segueMinProfil", sender: self)
            
        } else {
            
            let alertController = UIAlertController(title: "Ups!", message: "Husk at udfylde alle felter", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround() 
        
        ref = Database.database().reference()
        
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("name").observe(.value, with:{ snapshot in
            self.navnField.text = snapshot.value as? String
        })
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("address").observe(.value, with:{ snapshot in
            self.adresseField.text = snapshot.value as? String
        })
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("zipCode").observe(.value, with:{ snapshot in
            self.postNummerField.text = snapshot.value as? String
        })
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("city").observe(.value, with:{ snapshot in
            self.byField.text = snapshot.value as? String
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
