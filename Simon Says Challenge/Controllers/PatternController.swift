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
    var nextColorIndex = 0
    var nextColor: Color?
    
    // MARK: - Game Methods
    
    // Check if this is the next color in the pattern
    func isIncorrect(color: Color) -> Bool {
        if pattern[nextColorIndex] != color {
            nextColorIndex = 0
            return true
        }
        return false
    }
    
    // Check if this is the last color in the pattern
    func isLast(color: Color) -> Bool {
        if nextColorIndex == pattern.count - 1 {
            nextColorIndex = 0
            return true
        }
        nextColorIndex += 1
        return false
    }
    
    // Update index based on wether there's a next color
    func canDisplayNextColor() -> Bool {
        if nextColorIndex < pattern.count {
            nextColor = pattern[nextColorIndex]
            nextColorIndex += 1
            return true
        }
        nextColor = nil
        nextColorIndex = 0
        return false
    }
    
    // Add the next color to the pattern
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
