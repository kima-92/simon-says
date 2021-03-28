//
//  GameViewController.swift
//  Simon Says Challenge
//
//  Created by macbook on 3/28/21.
//

import UIKit

class GameViewController: UIViewController {
    
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
    }
    
    // MARK: - Actions
    
    // Color Buttons
    @IBAction func redButtonTapped(_ sender: UIButton) {
    }
    @IBAction func blueButtonTapped(_ sender: UIButton) {
    }
    @IBAction func purpleButtonTapped(_ sender: UIButton) {
    }
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
    }
    
    // Game Buttons
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    @IBAction func tryAgainButtonTapped(_ sender: UIButton) {
    }
}
