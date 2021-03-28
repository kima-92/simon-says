//
//  PatternController.swift
//  Simon Says Challenge
//
//  Created by macbook on 3/28/21.
//

import Foundation

class PatternController {
    
    // MARK: - Properties
    
    var pattern: [Color] = []
    
    // MARK: - Game Methods
    
    func addNextColor() {
        let randomNumber = Int.random(in: 0...100)
        
        if randomNumber % 7 == 0 {
            pattern.append(.red)
        } else if randomNumber % 5 == 0 {
            pattern.append(.blue)
        } else if randomNumber % 2 == 0 {
            pattern.append(.purple)
        } else {
            pattern.append(.yellow)
        }
    }
}
