//
//  randomColorTextFieldDelegate.swift
//  randomColorDelegate
//
//  Created by Souji on 3/22/16.
//  Copyright © 2016 Souji. All rights reserved.
//

import Foundation
import UIKit

class randomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func randomColor() -> UIColor {
        
        let randomColor = UIColor(red: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), green: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), blue: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), alpha: 1)
        
        return randomColor
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        textField.textColor = self.randomColor()
        return true
    }
    
    
}