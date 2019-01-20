//
//  ViewController2.swift
//  MultiView
//
//  Created by Evan Corriere on 1/17/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var passLbl: UILabel!
    
    var user: String?
    var pass: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let usertemp = user {
            userLbl.text = usertemp
        }
        
        if let passtemp = pass {
            passLbl.text = passtemp
        }
        // Do any additional setup after loading the view.
    }
    
   
    
    
}
