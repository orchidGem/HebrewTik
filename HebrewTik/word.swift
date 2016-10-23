//
//  word.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import Foundation

class Word {
    var id: Int!
    var datedAdded: NSDate!
    var text: String!
    var category: Category!
    var translation: String?
    var audio: String?
    var example: String?
    var notes: String?
    
    init(id: Int, text: String, translation: String, category: Category) {
        self.id = id
        self.text = text
        self.translation = translation
        self.category = category
    }
    
}

