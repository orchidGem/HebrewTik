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
    var words: [Word]?
    var wordID: Int!
    var audioRecorded: Bool = false
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        words = Words.readWordsFromArchive()
        if let words = words {
            wordID = words.count + 1
        } else {
            wordID = 1
        }
        
        print("Word ID: \(wordID)")
        
        textTextField.isEnabled = false
        
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addWord(_ sender: AnyObject) {
        
        print("adding word")
        
        // if text fields are empty, return
        guard let wordText = textTextField.text, let translationText = translationTextField.text  else {
            print("must enter text")
            return
        }

        // create word and append to words array
        let word = Word(id: wordID, text: wordText, translation: translationText)
        
        // if audio has been recorded, set the audio file property name
        if audioRecorded {
            word.audio = "word\(wordID!)"
        }
        
        if let _ = words {
            words?.insert(word, at: 0)
        } else {
            words = [word]
        }
        
        
        if(Words.saveWordsToArchive(words: words!)) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func recordAudio(_ sender: AnyObject) {
        audioRecorded = true
        recordTapped()
    }
    
    @IBAction func playAudioRecording(_ sender: AnyObject) {
        playAudio()
    }
    
    @IBAction func editWord(_ sender: AnyObject) {
        
        textTextField.isEnabled = true
        textTextField.backgroundColor = UIColor.white
    }
    
}
