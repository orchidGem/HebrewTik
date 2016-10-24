//
//  AddWordViewController.swift
//  HebrewTik
//
//  Created by Laura Evans on 10/23/16.
//  Copyright © 2016 Laura Evans. All rights reserved.
//

import UIKit

class AddWordViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var translationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTextField.delegate = self
        translationTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func cancel(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addWord(_ sender: AnyObject) {
        
        guard let wordText = textTextField.text, let translationText = translationTextField.text  else {
            return
        }
        
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
}
