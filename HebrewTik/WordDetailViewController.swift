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
    var audioPlayer: AVAudioPlayer!

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var exampleTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = word?.text
        translationLabel.text = word?.translation
        exampleTextView.text = word?.example
        
        if let _ = word?.audio {
            playButton.isHidden = false
        } else {
            playButton.isHidden = true
        }
        
    }
    
    @IBAction func playRecording(_ sender: AnyObject) {
        if let wordAudioPlayer = word?.playAudioRecording() {
            playButton.alpha = 0.5
            audioPlayer = wordAudioPlayer
            audioPlayer.delegate = self
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("audio stopped playing")
        playButton.alpha = 1
    }

    

}
