//
//  PlayViewController.swift
//  RoShamBo
//
//  Created by Timothy Myers on 10/24/16.
//  Copyright © 2016 okayestprogrammer. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rockPlayed(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        controller.playerPlayed = "rock"
        
        let computer = randomPlay()
        
        controller.computerPlayed = computer
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }

    @IBAction func paperPlayed(sender: AnyObject) {
        self.performSegueWithIdentifier("paperPlayed", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        let computer = randomPlay()
        controller.computerPlayed = computer
        
        if segue.identifier == "paperPlayed" {
            controller.playerPlayed = "paper"
        } else if segue.identifier == "scissorsPlayed" {
            controller.playerPlayed = "scissors"
        }
    }
    
    func randomPlay() -> String {
        var choice: Int
        
        choice = Int(1 + arc4random() % 3)
        
        switch choice {
        case 1:
            return "rock"
        case 2:
            return "paper"
        case 3:
            return "scissors"
        default:
            print("An error Occured")
            return "An Error Occured!"
        }
    }
    
    
}

