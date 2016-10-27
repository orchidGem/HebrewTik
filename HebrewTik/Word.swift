//
//  word.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import Foundation
import AVFoundation

class Word: NSObject, NSCoding {
    var id: Int!
    var dateAdded: NSDate!
    var text: String!
//    var category: Category! ADD ME BACK LATER!!!
    var translation: String?
    var audio: String?
    var example: String?
    var notes: String?
    var recordedAudio: AVAudioPlayer!
    
    
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
    
    func playAudioRecording() -> AVAudioPlayer? {
        //return if word has no audio
        guard let audio = audio else {
            print("word has no audio recording")
            return nil
        }
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent("\(audio).m4a")
        
        do {
            let sound = try AVAudioPlayer(contentsOf: audioFilename)
            recordedAudio = sound
            sound.volume = 1.0
            sound.play()
            print("playing audio file")
            return recordedAudio
        } catch {
            //failed
            print("failed")
            return nil
        }
        
    }
    
    // helper method to return documents directory
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
        
}

