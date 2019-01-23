//
//  ListingViewController.swift
//  FlashcardApp
//
//  Created by Evan Corriere on 1/22/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {

    let rowHeight = 70
    var flashcardSet: FlashcardSet?
    var sets: [FlashcardSet] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureSets()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    func configureSets() {
        let spanish1 = FlashcardSet(title: "Chapter 1", subject: "Spanish",
                        flashcards: [ Flashcard(front: "Hello", back: "Hola"),
                                      Flashcard(front: "Food", back: "la comida"),
                                      Flashcard(front: "Friend", back: "el/la amigo,a")])
        let math = FlashcardSet(title: "Formulas", subject: "Math",
                        flashcards: [ Flashcard(front: "Pythagorean Theorem", back: "a^2+b^2=c^2"),
                                      Flashcard(front: "Sin/Cos", back: "tan"),
                                      Flashcard(front: "2 + 2", back: "4")])
        let spanish2 = FlashcardSet(title: "Chapter 2", subject: "Spanish",
                                   flashcards: [ Flashcard(front: "Hello", back: "Hola"),
                                                 Flashcard(front: "Food", back: "la comida"),
                                                 Flashcard(front: "Friend", back: "el/la amigo,a")])
        let spanish3 = FlashcardSet(title: "Chapter 3", subject: "Spanish",
                                   flashcards: [ Flashcard(front: "Hello", back: "Hola"),
                                                 Flashcard(front: "Food", back: "la comida"),
                                                 Flashcard(front: "Friend", back: "el/la amigo,a")])
        sets.append(spanish1)
        sets.append(math)
        sets.append(spanish2)
        sets.append(spanish3)
    }
    
    
    func insertSet(flashcardSet: FlashcardSet) {
        sets.append(flashcardSet)
        let indexPath = IndexPath(row: sets.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? StudyingViewController {
            dest.studySet = flashcardSet
        }
    }
   
}

extension ListingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let set = sets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SetCell") as! SetCell
        cell.configure(flashcardSet: set)
        cell.delegate = self
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(rowHeight)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            sets.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
    }
}

extension ListingViewController: SetCellDelegate {
    
    func tappedStudy(set: FlashcardSet) {
        flashcardSet = set
        performSegue(withIdentifier: "studySegue", sender: nil)
        print("tapped")
    }
}
