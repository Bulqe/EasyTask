//
//  ViewController.swift
//  EasyTask
//
//  Created by Burim on 05/10/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    @IBAction func logInButtonClick(_ sender: UIButton) {
        
        if emailField.text != "" && passwordField.text != ""
        {
            Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                if user != nil{
                    // Sign In Successful
                    self.performSegue(withIdentifier: "segue", sender: self)
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

