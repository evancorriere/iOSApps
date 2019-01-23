//
//  FlashcardSet.swift
//  FlashcardApp
//
//  Created by Evan Corriere on 1/22/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import Foundation


class FlashcardSet {
    
    var title: String
    var subject: String
    var flashcards: [Flashcard]
    
    init(title:String,subject:String, flashcards:[Flashcard]) {
        self.title = title
        self.subject = subject
        self.flashcards = flashcards
    }
    
}
