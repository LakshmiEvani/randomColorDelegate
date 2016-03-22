//
//  ViewController.swift
//  randomColorDelegate
//
//  Created by Souji on 3/21/16.
//  Copyright © 2016 Souji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!

    @IBOutlet weak var textField3: UITextField!
    
    
    @IBOutlet weak var CharacterCountLabel: UILabel!
    
    // Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorDelegate = randomColorTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.CharacterCountLabel.hidden = true
        
        // Set the three delegates
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = randomColorDelegate
        self.textField3.delegate = self
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // hide the label if the newText will be an empty string
        self.CharacterCountLabel.hidden = (newText.length == 0)
        
        // Write the length of newText into the label
        self.CharacterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true;
    }



}

