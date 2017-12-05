//
//  MineTasksViewController.swift
//  EasyTask
//
//  Created by Burim on 04/12/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import UIKit

class MineTasksViewController: ViewController {

    @IBOutlet weak var burgerMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            burgerMenu.target = self.revealViewController()
            burgerMenu.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
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
