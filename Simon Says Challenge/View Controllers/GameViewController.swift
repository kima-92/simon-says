//
//  GameViewController.swift
//  Simon Says Challenge
//
//  Created by macbook on 3/28/21.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - Properties
    
    var patternController = PatternController()
    var colorButtons: [Color: UIButton]?
    var timer: Timer?
    var score: Int = 0
    
    // MARK: - Outlets
    
    // Labels
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    // Game Buttons
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    // Color Buttons
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        collectButtons()
    }
    
    // MARK: - Actions
    
    // Color Buttons
    @IBAction func redButtonTapped(_ sender: UIButton) {
        redButton.flash()
        checkIfCorrect(colorButton: sender)
    }
    @IBAction func blueButtonTapped(_ sender: UIButton) {
        blueButton.flash()
        checkIfCorrect(colorButton: sender)
    }
    @IBAction func purpleButtonTapped(_ sender: UIButton) {
        purpleButton.flash()
        checkIfCorrect(colorButton: sender)
    }
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        yellowButton.flash()
        checkIfCorrect(colorButton: sender)
    }
    
    // Game Buttons
    @IBAction func startButtonTapped(_ sender: UIButton) {
        startGame()
    }
    @IBAction func tryAgainButtonTapped(_ sender: UIButton) {
        startGame()
    }
    
    // MARK: - Game Methods
    
    private func startGame() {
        startButton.isHidden = true
        tryAgainButton.isEnabled = false
        tryAgainButton.alpha = 0
        gameOverLabel.alpha = 0
        
        score += 0
        scoreLabel.text = "Score: \(score)"
        enableColorButtons()
        displayPattern()
    }
    
    private func displayPattern() {
        patternController.addNextColor()
        enableColorButtons(enabled: false)
        timer = Timer.scheduledTimer(timeInterval: 0.6,
                                     target: self,
                                     selector: #selector(tryToAnimateButton),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    // Try to animate the next color's button
    @objc private func tryToAnimateButton() {
        guard let colorButtons = colorButtons else { return }
        
        if patternController.canDisplayNextColor() {
            if let color = patternController.nextColor,
               let button = colorButtons[color] {
                button.flash()
            }
        } else {
            enableColorButtons()
            timer?.invalidate()
        }
    }
    
    // Check if the player continues playing, if they finished the pattern, or if they lost
    private func checkIfCorrect(colorButton: UIButton) {
        
        // Player's chosen color
        guard let colorElement = colorButtons?.filter({ $0.value == colorButton }),
              let color = colorElement.first?.key else { return }
        
        // Continue or stop game
        if patternController.isIncorrect(color: color) {
            
            patternController.resetGame()
            tryAgainButton.isEnabled = true
            tryAgainButton.alpha = 1
            gameOverLabel.alpha = 1
            enableColorButtons(enabled: false)
            score = 0
            return
        }
        if patternController.isLast(color: color) {
            score += 15
            scoreLabel.text = "Score: \(score)"
            displayPattern()
        }
    }
    
    // MARK: - Helper Methods
    
    private func collectButtons() {
        colorButtons = [.red : redButton,
                        .blue : blueButton,
                        .purple : purpleButton,
                        .yellow : yellowButton
        ]
    }
    
    private func enableColorButtons(enabled isEnabled: Bool = true) {
        redButton.isEnabled = isEnabled
        blueButton.isEnabled = isEnabled
        purpleButton.isEnabled = isEnabled
        yellowButton.isEnabled = isEnabled
    }
    
    private func updateViews() {
        gameOverLabel.alpha = 0
        tryAgainButton.isEnabled = false
        tryAgainButton.alpha = 0
        score = 0
        scoreLabel.text = "Score: \(score)"
        
        enableColorButtons(enabled: false)
        redButton.layer.cornerRadius = 5
        blueButton.layer.cornerRadius = 5
        purpleButton.layer.cornerRadius = 5
        yellowButton.layer.cornerRadius = 5
    }
}
