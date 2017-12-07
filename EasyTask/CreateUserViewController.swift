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
        
        var emailText = emailField.text
        emailText = emailText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var emailCheck = emailText?.replacingOccurrences(of: " ", with: "")
        
        var passwordText = passwordField.text
        passwordText = passwordText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var passwordCheck = passwordText?.replacingOccurrences(of: " ", with: "")
        
        var confirmPasswordText = ConfirmPasswordField.text
        confirmPasswordText = confirmPasswordText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var confirmCheck = confirmPasswordText?.replacingOccurrences(of: " ", with: "")
        
        var navnText = navnField.text
        navnText = navnText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var navnCheck = navnText?.replacingOccurrences(of: " ", with: "")
        
        var adresseText = adresseField.text
        adresseText = adresseText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var adresseCheck = adresseText?.replacingOccurrences(of: " ", with: "")
        
        var byText = byField.text
        byText = byText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var byCheck = byText?.replacingOccurrences(of: " ", with: "")
        
        var postNrText = postNrField.text
        postNrText = postNrText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var postCheck = postNrText?.replacingOccurrences(of: " ", with: "")
        
        var mobilNummerText = mobilNummerField.text
        mobilNummerText = mobilNummerText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var mobilCheck = mobilNummerText?.replacingOccurrences(of: " ", with: "")
        
        if emailText != "" && passwordText != "" && passwordText == confirmPasswordText && navnText != "" && adresseText != "" && byText != "" && postNrText != "" && mobilNummerText != "" && emailCheck != "" && passwordCheck != "" && passwordCheck == confirmCheck && navnCheck != "" && adresseCheck != "" && byCheck != "" && postCheck != "" && mobilCheck != "" && DoingTasksSwitch.isOn != CreatingTasksSwitch.isOn
        {
            
            Auth.auth().createUser(withEmail: emailText!, password: passwordText!, completion: { (user, error) in
                if user != nil{
                    ref = Database.database().reference()
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("email").setValue(Auth.auth().currentUser?.email)
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("name").setValue(navnText)
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("address").setValue(adresseText)
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("city").setValue(byText)
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("zipCode ").setValue(postNrText)
                    
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
            
        } else {
            
            let alertController = UIAlertController(title: "Ups!", message: "Husk at udfylde alle felter og du skal vælge hvad du vil", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        DoingTasksSwitch.setOn(true, animated: true)
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
