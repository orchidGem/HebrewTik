//
//  WordDetailViewController.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import UIKit

class WordDetailViewController: UIViewController {
    
    var word: Word?

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = word?.text
        translationLabel.text = word?.translation
        
        if let audio = word?.audio {
            print("audio: \(audio)")
        } else {
            print("no audio file")
        }

    }

}
