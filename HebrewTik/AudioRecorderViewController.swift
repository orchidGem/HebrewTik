//
//  AudioRecorderViewController.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/25/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import AVFoundation

extension AddWordViewController {
    
    func startRecording() {
        audioFilename = getDocumentsDirectory().appendingPathComponent("word\(wordID!).m4a")
        
        print("Audio File Name")
        print(audioFilename)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
        } catch {
            finishRecording(success: false)
        }
    }
    
    // helper method to return documents directory
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
        }
    }
    
    func recordTapped() {
        print("recording")
        if audioRecorder == nil {
            recordButton.setTitle("Recording...tap to stop", for: .normal)
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func playAudio() {
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
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playButton.alpha = 1
    }

   
}
