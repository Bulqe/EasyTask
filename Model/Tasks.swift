//
//  File.swift
//  EasyTask
//
//  Created by Burim on 02/12/2017.
//  Copyright © 2017 EasyTask. All rights reserved.
//

import Foundation
class Tasks {
    var title: String
    var description: String
    var payment: String
    
    init(titleText: String, descriptionText: String, paymentText: String) {
        title = titleText
        description = descriptionText
        payment = paymentText
    }
}
