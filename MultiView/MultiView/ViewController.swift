//
//  ViewController.swift
//  MultiView
//
//  Created by Evan Corriere on 1/17/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var usernameEntry: UITextField!
    @IBOutlet weak var passwordEntry: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print(usernameEntry.text)
        if segue.destination is ViewController2
        {
            let vc = segue.destination as? ViewController2
            vc?.user = usernameEntry.text
            vc?.pass = passwordEntry.text
        }
        
    }

}

