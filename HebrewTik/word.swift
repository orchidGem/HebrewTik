//
//  word.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import Foundation

class Word: NSObject, NSCoding {
    var id: Int!
    var dateAdded: NSDate!
    var text: String!
//    var category: Category! ADD ME BACK LATER!!!
    var translation: String?
    var audio: String?
    var example: String?
    var notes: String?
    
    
    init(id: Int, text: String, translation: String) {
        self.id = id
        self.text = text
        self.translation = translation
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as! Int?
        self.text = aDecoder.decodeObject(forKey: "text") as! String?
        self.translation = aDecoder.decodeObject(forKey: "translation") as! String?
        self.audio = aDecoder.decodeObject(forKey: "audio") as! String?
        self.example = aDecoder.decodeObject(forKey: "example") as! String?
        self.notes = aDecoder.decodeObject(forKey: "notes") as! String?
        self.dateAdded = aDecoder.decodeObject(forKey: "dateAdded") as! NSDate?
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.text, forKey: "text")
        aCoder.encode(self.translation, forKey: "translation")
        aCoder.encode(self.audio, forKey: "audio")
        aCoder.encode(self.example, forKey: "example")
        aCoder.encode(self.notes, forKey: "notes")
        aCoder.encode(self.dateAdded, forKey: "dateAdded")
    }
        
}

