//
//  EmojiTextFieldDelegate.swift
//  randomColorDelegate
//
//  Created by Souji on 3/21/16.
//  Copyright © 2016 Souji. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    var translations = [String : String]()
    
    override init() {
        super.init()
        
        translations = ["heart":"\u{0001F496}","bird" :"\u{E523}", "fish": "\u{E522}", "frog": "\u{E531}",
            "bear": "\u{E527}", "dog":"\u{E052}", "cat": "\u{E04F}"]
       
       
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var replacedAnEmoji = false
        var emojiStringRange: NSRange
        
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // For each dictionary entry in translations, pull out a string to search for
        // and an emoji to replace it with
        
        for (emojiString, emoji) in translations {
            
            // Search for all occurances of key (ie. "dog"), and replace with emoji (ie. 🐶)
            repeat {
                emojiStringRange = newText.rangeOfString(emojiString, options: NSStringCompareOptions.CaseInsensitiveSearch)
                
                // found one
                if emojiStringRange.location != NSNotFound {
                    newText = newText.stringByReplacingCharactersInRange(emojiStringRange, withString: emoji)
                    replacedAnEmoji = true
                }
                
            } while emojiStringRange.location != NSNotFound
        }
        
        // If we have replaced an emoji, then we directly edit the text field
        // Otherwise we allow the proposed edit.
        if replacedAnEmoji {
            textField.text = newText as String
            return false
        } else {
            return true
        }
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
}
