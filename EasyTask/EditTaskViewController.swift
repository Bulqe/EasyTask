//
//  EditTaskViewController.swift
//  EasyTask
//
//  Created by Burim on 27/11/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit
import Firebase

class EditTaskViewController: UIViewController {
    
        var ref:DatabaseReference?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var paymentField: UITextField!
    @IBOutlet weak var editTaskButton: UIButton!
    
    @IBAction func editTaskButtonClick(_ sender: UIButton) {
        
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
            
            let tasksId = idList[myIndex2]
            ref?.child("tasks").child(tasksId).child("title").setValue(titleText)
            ref?.child("tasks").child(tasksId).child("description").setValue(descriptionText)
            ref?.child("tasks").child(tasksId).child("payment").setValue(paymentText)
            
            self.performSegue(withIdentifier: "segueEditTaskDone", sender: self)
            
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

        let tasksId =  idList[myIndex2]
        ref?.child("tasks").child(tasksId).child("title").observe(.value, with:{ snapshot in
            self.titleField.text = snapshot.value as? String
        })
        ref?.child("tasks").child(tasksId).child("description").observe(.value, with:{ snapshot in
            self.descriptionField.text = snapshot.value as? String
        })
        ref?.child("tasks").child(tasksId).child("payment").observe(.value, with:{ snapshot in
            self.paymentField.text = snapshot.value as? String
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
