//
//  CreateSetViewController.swift
//  FlashcardApp
//
//  Created by Evan Corriere on 1/23/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import UIKit

class CreateSetViewController: UIViewController {

    var flashcardSet:FlashcardSet?
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var subjectTF: UITextField!
    
    @IBOutlet weak var frontTF1: UITextField!
    @IBOutlet weak var backTF1: UITextField!
    
    @IBOutlet weak var frontTF2: UITextField!
    @IBOutlet weak var backTF2: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func createAction(_ sender: Any) {
        configureSet()
        navigationController?.popViewController(animated: true)
    }
    
    func configureSet() {
        flashcardSet = FlashcardSet(title: titleTF.text!, subject: subjectTF.text!,
                                flashcards: [ Flashcard(front: frontTF1.text!, back: backTF1.text!),
                                              Flashcard(front: frontTF2.text!, back: backTF2.text!)])
        titleTF.text =  ""
        subjectTF.text = ""
        frontTF1.text = ""
        frontTF2.text = ""
        backTF1.text = ""
        backTF2.text = ""
        print("created the set")
        
        let viewControllers = self.navigationController?.viewControllers
        let count = viewControllers?.count
        if count! > 1 {
            if let dest = viewControllers?[count! - 2] as? ListingViewController {
                print("CP1")
                dest.insertSet(flashcardSet: flashcardSet!)
            }
        }
        
        
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ListingViewController {
            if flashcardSet != nil {
                dest.insertSet(flashcardSet: flashcardSet!)
            }
        }
        print("segue")
    }
    
    
}
