//
//  SetCell.swift
//  FlashcardApp
//
//  Created by Evan Corriere on 1/22/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import UIKit

protocol SetCellDelegate {
    func tappedStudy(set:FlashcardSet)
}

class SetCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var studyBtn: UIButton!
    
    var delegate: SetCellDelegate?
    var flashcardSet: FlashcardSet!
    
    func configure(flashcardSet: FlashcardSet) {
        self.flashcardSet = flashcardSet
        titleLbl.text = flashcardSet.title
        subjectLbl.text = flashcardSet.subject
        studyBtn.layer.cornerRadius = 15
    }
    
    @IBAction func tappedStudy(_ sender: Any) {
        delegate?.tappedStudy(set: flashcardSet)
    }
    
    
    
}
