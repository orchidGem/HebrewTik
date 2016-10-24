//
//  Words.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/24/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import Foundation

class Words: NSObject, NSCoding {
    var words: [Word]?
    
    required init?(coder aDecoder: NSCoder) {
        self.words = aDecoder.decodeObject(forKey: "words") as! [Word]?
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.words, forKey: "words")
    }
    
    // Where are we storing this file on disc - cart.archive file
    class func archiveFilePath() -> String {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return
            documentsDirectory.appendingPathComponent("word").path
    }
    
    // read and return array of orders
    class func readOrdersFromArchive() -> [Word]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveFilePath()) as? [Word]
    }
    
    // save the orders to disc
    class func saveOrdersToArchive(orders: [Word]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
    }

}
