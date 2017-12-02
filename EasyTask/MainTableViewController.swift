//
//  MainTableViewController.swift
//  EasyTask
//
//  Created by Burim on 02/12/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text = tasksList[myIndex].title
        paymentLabel.text = (tasksList[myIndex].payment + " Kr")
        descriptionText.text = tasksList[myIndex].description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
