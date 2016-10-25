//
//  AddWordViewController.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import UIKit
import AVFoundation

class AddWordViewController: UIViewController, UITextFieldDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var translationTextField: UITextField!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var recordedAudio: AVAudioPlayer!
    var audioFilename: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTextField.delegate = self
        translationTextField.delegate = self

        //hide record button
        recordButton.isHidden = true
        
        // Request user permission to record audio
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        // show button
                        self.recordButton.isHidden = false
                    } else {
                        //failed to record
                    }
                }
            }
        } catch {
            // failed to record
        }
    }
    @IBAction func cancel(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addWord(_ sender: AnyObject) {
        
        // if text fields are empty, return
        guard let wordText = textTextField.text, let translationText = translationTextField.text  else {
            return
        }

        // create word and append to words array
        let word = Word(id: 1, text: wordText, translation: translationText)
        var words = Words.readOrdersFromArchive()
        words?.insert(word, at: 0)
        
        if let words = words {
            if(Words.saveOrdersToArchive(orders: words)) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func recordAudio(_ sender: AnyObject) {
        recordTapped()
    }
    
    @IBAction func playAudioRecording(_ sender: AnyObject) {
        playAudio()
    }
    
    
}
