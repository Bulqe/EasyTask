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
    
    @IBAction func CreateUserButtonClick(_ sender: UIButton) {
        
        var ref:DatabaseReference?
        
        
        if emailField.text != "" && passwordField.text != "" && passwordField.text == ConfirmPasswordField.text
        {
            
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                if user != nil{
                    ref = Database.database().reference()
                    ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("email").setValue(Auth.auth().currentUser?.email)
                    
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
