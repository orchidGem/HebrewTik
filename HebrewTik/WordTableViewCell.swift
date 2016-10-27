//
//  WordTableViewCell.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/26/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import UIKit
import AVFoundation

class WordTableViewCell: UITableViewCell, AVAudioPlayerDelegate {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var playAudioButton: UIButton!
    
    var word: Word!
    var audioPlayer: AVAudioPlayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if let word = word {
            print(word)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func playRecording(_ sender: AnyObject) {
        if let wordAudioPlayer = word?.playAudioRecording() {
            playAudioButton.alpha = 0.5
            audioPlayer = wordAudioPlayer
            audioPlayer.delegate = self
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playAudioButton.alpha = 1
    }

}
