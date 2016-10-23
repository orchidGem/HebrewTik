//
//  WordsTableViewController.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {
    
    var words: [Word]?

    override func viewDidLoad() {
        super.viewDidLoad()

        let word1 = Word(id: 1, text: "text1", category: .noun)
        let word2 = Word(id: 2, text: "text2", category: .verb)
        
        words = [word1, word2]

    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return words?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        if let word = words?[indexPath.row] {
            cell.textLabel?.text = word.text
        }

        return cell
    }

}
