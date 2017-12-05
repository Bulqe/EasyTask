//
//  CreateUserViewController.swift
//  EasyTask
//
//  Created by Burim on 09/11/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

class CreateUserViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var ConfirmPasswordField: UITextField!
    @IBOutlet weak var DoingTasksSwitch: UISwitch!
    @IBOutlet weak var CreatingTasksSwitch: UISwitch!
    @IBOutlet weak var CreateUserButton: UIButton!
    @IBOutlet weak var navnField: UITextField!
    @IBOutlet weak var adresseField: UITextField!
    @IBOutlet weak var byField: UITextField!
    @IBOutlet weak var postNrField: UITextField!
    @IBOutlet weak var mobilNummerField: UITextField!
    
    @IBAction func CreateUserButtonClick(_ sender: UIButton) {
        
        var ref:DatabaseReference?
        
        
        if emailField.text != "" && passwordField.text != "" && passwordField.text == ConfirmPasswordField.text && navnField.text != "" && adresseField.text != "" && byField.text != "" && postNrField.text != "" && mobilNummerField.text != ""
        {
            
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                if user != nil{
                    ref = Database.database().reference()
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("email").setValue(Auth.auth().currentUser?.email)
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("name").setValue(self.navnField.text)
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("address").setValue(self.adresseField.text)
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("city").setValue(self.byField.text)
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("zipCode").setValue(self.postNrField.text)
                    if (self.DoingTasksSwitch.isOn == true){
                        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("isTaskCreator").setValue(false)
                    }
                    if (self.CreatingTasksSwitch.isOn == true){
                        ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("isTaskCreator").setValue(true)
                    }
                    
                    
                    self.performSegue(withIdentifier: "segueLogIn", sender: self)
                    
                }
                else
                {
                    if let myError = error?.localizedDescription
                    {
                        print(myError)
                    }
                    else
                    {
                        print("ERROR")
                    }
                }
            })
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DoingTasksSwitch.setOn(false, animated: false)
        CreatingTasksSwitch.setOn(false, animated: false)
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
