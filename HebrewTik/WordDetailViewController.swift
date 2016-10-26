//
//  WordDetailViewController.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import UIKit
import AVFoundation

class WordDetailViewController: UIViewController, AVAudioPlayerDelegate {
    
    var word: Word?
    var recordedAudio: AVAudioPlayer!
    var audioFilename: URL!

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = word?.text
        translationLabel.text = word?.translation
        
        if let audio = word?.audio {
            playButton.isHidden = false
            audioFilename = getDocumentsDirectory().appendingPathComponent("\(audio).m4a")
            print(audioFilename)
        } else {
            playButton.isHidden = true
        }
    }
    
    @IBAction func playRecording(_ sender: AnyObject) {
        print(audioFilename!)
        do {
            let sound = try AVAudioPlayer(contentsOf: audioFilename!)
            recordedAudio = sound
            recordedAudio.delegate = self
            sound.volume = 1.0
            sound.play()
            playButton.alpha = 0.5
        } catch {
            //failed
            print("failed")
        }
        
    }
    
    // helper method to return documents directory
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    

}
