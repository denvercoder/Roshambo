//
//  ResultViewController.swift
//  RoShamBo
//
//  Created by Timothy Myers on 10/24/16.
//  Copyright © 2016 okayestprogrammer. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var playerPlayed: String!
    var computerPlayed: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.whoWon(playerPlayed, computerPlayed: computerPlayed)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func whoWon(playerPlayed: String, computerPlayed: String) -> Int {
        
        if playerPlayed == computerPlayed {
            displayResults("itsATie.png", message: "It's a tie your dad would love!")
            return 2
        }
        
        if playerPlayed == "rock" {
            if computerPlayed == "scissors" {
                displayResults("RockCrushesScissors.jpeg", message: "Rock crushes scissors, You Win!")
                return 1
            }
        }
        
        if playerPlayed == "paper" {
            if computerPlayed == "rock" {
                displayResults("PaperCoversRock.jpg", message: "Paper covers Rock, You Win!")
                return 1
            }
            if computerPlayed == "scissors" {
                displayResults("ScissorsCutPaper.jpg", message: "Scissors cuts paper, You Lose :(")
                return 0
            }
        }
        
        if playerPlayed == "scissors" {
            if computerPlayed == "paper" {
                displayResults("ScissorsCutPaper.jpg", message: "Scissors cuts paper, You Win!")
                return 1
            }
            if computerPlayed == "rock" {
                displayResults("RockCrushesScissors.jpeg", message: "Rock smashes scissors, You Lose :(")
                return 0
            }
        }
      
        return -1
    }
    
    func displayResults(result: String, message: String) {
        self.image.image = UIImage(named: result)
        self.label.text = message
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
