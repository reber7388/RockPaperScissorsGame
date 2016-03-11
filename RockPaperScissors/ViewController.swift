//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Reber on 3/10/16.
//  Copyright © 2016 Reber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    enum rockPaperScissors: String {
        case Rock = "rock"
        case Paper = "paper"
        case Scissors = "scissors"
        case None = "none"
        
    }
    
    var randomNum = arc4random()%3
   
    var checkForWin = false
    var winScore = 0
    var loseScore = 0
    var itsATie = 0
    var playerChoice: rockPaperScissors = rockPaperScissors.None
    var compChoice: rockPaperScissors = rockPaperScissors.None
    
    @IBOutlet weak var displayWins: UILabel!
    @IBOutlet weak var displayLoses: UILabel!
    @IBOutlet weak var displayTie: UILabel!
    
   
    
    
    
    @IBAction func onRockPressed(sender: AnyObject){
        
        determinWinner(rockPaperScissors.Rock)
        
    }
    
    @IBAction func onPaperPressed(sender: AnyObject){
        
        determinWinner(rockPaperScissors.Paper)
        
    }
    
    @IBAction func onScissorsPressed(sender: AnyObject){
        
        determinWinner(rockPaperScissors.Scissors)
        
    }
    
    func determinWinner(win: rockPaperScissors){
        
        computerPlayer()
        
        //User wins cases
        if playerChoice == rockPaperScissors.Rock && compChoice == rockPaperScissors.Scissors {
            checkForWin = true
            processWin()
        } else if playerChoice == rockPaperScissors.Paper && compChoice == rockPaperScissors.Rock {
            checkForWin = true
            processWin()
        } else if playerChoice == rockPaperScissors.Scissors && compChoice == rockPaperScissors.Paper {
            checkForWin = true
            processWin()
        } else if   playerChoice == rockPaperScissors.Rock && compChoice == rockPaperScissors.Rock ||
                    playerChoice == rockPaperScissors.Paper && compChoice == rockPaperScissors.Paper ||
                    playerChoice == rockPaperScissors.Scissors && compChoice == rockPaperScissors.Scissors {
            itsATie += 1
            displayTie.text = "\(itsATie)"
        }
        
    }
    
    func computerPlayer(){
        
        randomNum = arc4random()%3
        
        if randomNum == 0 {
            compChoice = rockPaperScissors.Rock
        }else if randomNum == 1 {
            compChoice = rockPaperScissors.Paper
        }else if randomNum == 2 {
            compChoice = rockPaperScissors.Scissors
        }
        
    }
    
    func processWin(){
        if checkForWin == true {
            winScore += 1
            displayWins.text = "\(winScore)"
            
        } else if checkForWin == false {
            loseScore += 1
            displayLoses.text = "\(loseScore)"
        }
    }


}

