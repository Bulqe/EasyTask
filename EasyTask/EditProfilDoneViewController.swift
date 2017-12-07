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
    @IBOutlet weak var mobilNummerField: UITextField!
    
    var ref:DatabaseReference?
    
    @IBAction func gemButtonClick(_ sender: Any) {
        
        var navnText = navnField.text
        navnText = navnText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var navnCheck = navnText?.replacingOccurrences(of: " ", with: "")
        
        var adresseText = adresseField.text
        adresseText = adresseText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var adresseCheck = adresseText?.replacingOccurrences(of: " ", with: "")
        
        var byText = byField.text
        byText = byText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var byCheck = byText?.replacingOccurrences(of: " ", with: "")
        
        var postNrText = postNummerField.text
        postNrText = postNrText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var postCheck = postNrText?.replacingOccurrences(of: " ", with: "")
        
        var mobilNummerText = mobilNummerField.text
        mobilNummerText = mobilNummerText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var mobilCheck = mobilNummerText?.replacingOccurrences(of: " ", with: "")
        
        ref = Database.database().reference()
        
        if navnText != "" && adresseText != "" && postNrText != "" && byText != "" && mobilNummerText != "" && navnCheck != "" && adresseCheck != "" && postCheck != "" && byCheck != "" && mobilCheck != "" {
        
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("name").setValue(navnText)
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("address").setValue(adresseText)
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("city").setValue(byText)
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("zipCode").setValue(postCheck)
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("phonenumber").setValue(mobilNummerText)
     
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
        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("phonenumber").observe(.value, with:{ snapshot in
            self.mobilNummerField.text = snapshot.value as? String
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
