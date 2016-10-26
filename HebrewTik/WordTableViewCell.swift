//
//  WordTableViewCell.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/26/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import UIKit

class WordTableViewCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var playAudioButton: UIButton!
    
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
    }
}
