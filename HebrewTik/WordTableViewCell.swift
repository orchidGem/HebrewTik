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
    
    var recordedAudio: AVAudioPlayer!
    var audioFilename: URL!
    var audioString: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func playRecording(_ sender: AnyObject) {
        print("play")
        
        audioFilename = getDocumentsDirectory().appendingPathComponent("\(audioString!).m4a")

        do {
            let sound = try AVAudioPlayer(contentsOf: audioFilename!)
            recordedAudio = sound
            recordedAudio.delegate = self
            sound.volume = 1.0
            sound.play()
            playAudioButton.alpha = 0.5
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
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playAudioButton.alpha = 1
    }

}
