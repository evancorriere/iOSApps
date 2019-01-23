//
//  Flashcard.swift
//  FlashcardApp
//
//  Created by Evan Corriere on 1/22/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import Foundation

class Flashcard {
    
    var front: String
    var back: String
    
    init(front:String, back:String) {
        self.front = front
        self.back = back
    }
}
