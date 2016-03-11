//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Reber on 3/10/16.
//  Copyright © 2016 Reber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayWins: UILabel!
    @IBOutlet weak var displayLoses: UILabel!
    @IBOutlet weak var displayTie: UILabel!
    @IBOutlet weak var rockImg: UIImageView!
    @IBOutlet weak var paperImg: UIImageView!
    @IBOutlet weak var scissorsImg: UIImageView!
    @IBOutlet weak var nextRoundBtn: UIButton!
    @IBOutlet weak var playerRockBtn: UIButton!
    @IBOutlet weak var playerPaperBtn: UIButton!
    @IBOutlet weak var playerScissorsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextRoundBtn.hidden = true
        
    }
    
    enum rockPaperScissors: String {
        case Rock = "rock"
        case Paper = "paper"
        case Scissors = "scissors"
        case None = "none"
        
    }
    
    var randomNum = arc4random()%3
   
    var checkForWin = true
    var winScore = 0
    var loseScore = 0
    var itsATie = 0
    var playerChoice: rockPaperScissors = rockPaperScissors.None
    var compChoice: rockPaperScissors = rockPaperScissors.None
    
    
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
        
        playerChoice = win
        hideNonselected()
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
            displayTie.text = "Ties: " + "\(itsATie)"
            nextRoundBtn.hidden = false
        } else if playerChoice == rockPaperScissors.Rock && compChoice == rockPaperScissors.Paper {
            checkForWin = false
            processWin()
        } else if playerChoice == rockPaperScissors.Paper && compChoice == rockPaperScissors.Scissors {
            checkForWin = false
            processWin()
        } else if playerChoice == rockPaperScissors.Scissors && compChoice == rockPaperScissors.Rock {
            checkForWin = false
            processWin()
        }
        
    }
    
    func computerPlayer() {
        
        randomNum = arc4random()%3
        
        if randomNum == 0 {
            compChoice = rockPaperScissors.Rock
            paperImg.hidden = true
            scissorsImg.hidden = true
        }else if randomNum == 1 {
            compChoice = rockPaperScissors.Paper
            rockImg.hidden = true
            scissorsImg.hidden = true
        }else if randomNum == 2 {
            compChoice = rockPaperScissors.Scissors
            rockImg.hidden = true
            paperImg.hidden = true
        }
        
        
    }
    
    func processWin(){
        if checkForWin == true {
            winScore += 1
            displayWins.text = "Wins: " + "\(winScore)"
            nextRoundBtn.hidden = false
        } else if checkForWin == false {
            loseScore += 1
            displayLoses.text = "Loses: " + "\(loseScore)"
            nextRoundBtn.hidden = false
        }
    }
    
    @IBAction func nextRound(sender: AnyObject) {
        
        onNextRoundPressed()
        
    }
    
    func onNextRoundPressed(){
        
        rockImg.hidden = false
        paperImg.hidden = false
        scissorsImg.hidden = false
        playerRockBtn.hidden = false
        playerPaperBtn.hidden = false
        playerScissorsBtn.hidden = false
        playerChoice = rockPaperScissors.None
        compChoice = rockPaperScissors.None
        nextRoundBtn.hidden = true
        
    }
    
    func hideNonselected(){
        
        if playerChoice == rockPaperScissors.Rock {
            playerPaperBtn.hidden = true
            playerScissorsBtn.hidden = true
        } else if playerChoice == rockPaperScissors.Paper {
            playerRockBtn.hidden = true
            playerScissorsBtn.hidden = true
        } else if playerChoice == rockPaperScissors.Scissors {
            playerRockBtn.hidden = true
            playerPaperBtn.hidden = true
        }
        
    }


}

