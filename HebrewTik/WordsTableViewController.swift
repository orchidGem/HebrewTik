//
//  WordsTableViewController.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import UIKit

class WordsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var words: [Word]?
    @IBOutlet weak var wordsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordsTableView.delegate = self
        wordsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        words = Words.readWordsFromArchive()
        wordsTableView.reloadData()
    }


    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return words?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        if let word = words?[indexPath.row] {
            cell.textLabel?.text = word.text
        }
        
        cell.textLabel?.font = UIFont(name: "Arial Hebrew", size: 30)
        cell.textLabel?.textAlignment = .right
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowWord" {
            
            let wordVC = segue.destination as? WordDetailViewController
            
            guard let cell = sender as? UITableViewCell, let indexPath = wordsTableView.indexPath(for: cell) else {
                return
            }
            
            wordVC?.word = words?[indexPath.row]
            
        }
    }

}
