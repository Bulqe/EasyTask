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
        
        createTaskButton.isEnabled = false
        
        var titleText = titleField.text
        titleText = titleText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var titleCheck = titleText?.replacingOccurrences(of: " ", with: "")
        
        var descriptionText = descriptionField.text
        descriptionText = descriptionText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var descriptionCheck = descriptionText?.replacingOccurrences(of: " ", with: "")
        
        var paymentText = paymentField.text
        paymentText = paymentText?.trimmingCharacters(in: .whitespacesAndNewlines)
        var paymentCheck = paymentText?.replacingOccurrences(of: " ", with: "")
        
        ref = Database.database().reference()
        if titleText != "" && descriptionText != "" && paymentText != "" && titleCheck != "" && descriptionCheck != "" && paymentCheck != "" {
            
            let tasksId = self.ref?.child("tasks").childByAutoId().key
            ref?.child("users").child((Auth.auth().currentUser?.uid)!).child("tasks").child(tasksId!).setValue(true)
            ref?.child("tasks").child(tasksId!).child("title").setValue(titleText)
            ref?.child("tasks").child(tasksId!).child("description").setValue(descriptionText)
            ref?.child("tasks").child(tasksId!).child("payment").setValue(paymentText)
            ref?.child("tasks").child(tasksId!).child("creatorID").setValue((Auth.auth().currentUser?.uid)!)
            
            self.performSegue(withIdentifier: "segueCreateTask", sender: self)
            
        } else {
            
            let alertController = UIAlertController(title: "Ups!", message: "Husk at udfylde alle felter", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            createTaskButton.isEnabled = true
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
