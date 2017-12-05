//
//  CreateTaskViewController.swift
//  EasyTask
//
//  Created by Burim on 09/11/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

class CreateTaskViewController: UIViewController {

    var ref:DatabaseReference?

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var paymentField: UITextField!
    @IBOutlet weak var createTaskButton: UIButton!
    @IBAction func createTaskButtonClick(_ sender: UIButton) {
        
        ref = Database.database().reference()
        if titleField.text != "" && descriptionField.text != "" && paymentField.text != "" {
            
            let tasksId = self.ref?.child("tasks").childByAutoId().key
            ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("tasks").child(tasksId!).setValue(true)
            ref?.child("tasks").child(tasksId!).child("title").setValue(titleField.text)
            ref?.child("tasks").child(tasksId!).child("description").setValue(descriptionField.text)
            ref?.child("tasks").child(tasksId!).child("payment").setValue(paymentField.text)
            
            self.performSegue(withIdentifier: "segueCreateTask", sender: self)
            
        } else {
            
            let alertController = UIAlertController(title: "Ups!", message: "Husk at udfylde alle felter", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
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
