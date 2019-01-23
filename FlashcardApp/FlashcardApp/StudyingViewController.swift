//
//  StudyingViewController.swift
//  FlashcardApp
//
//  Created by Evan Corriere on 1/23/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import UIKit

class StudyingViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    var studySet: FlashcardSet?
    var index = 0
    var flipped = false
    
    @IBAction func flipAction(_ sender: Any) {
        flipped = !flipped
        setText()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if let set = studySet {
            index = (index + 1) % set.flashcards.count
            flipped = false
            setText()
        }
    }
    
    @IBAction func previousAction(_ sender: Any) {
        if let set = studySet {
            flipped = false
            if index == 0 {
                index = set.flashcards.count - 1
            } else {
                index -= 1
            }
            setText()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.layer.borderColor = UIColor.black.cgColor
        setText()
    }
    
    func setText() {
        if let set = studySet {
            if flipped {
                lbl.text = set.flashcards[index].back
            } else {
                lbl.text = set.flashcards[index].front
            }
        }
    }
}
