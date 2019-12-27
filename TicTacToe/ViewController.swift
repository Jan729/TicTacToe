//
//  ViewController.swift
//  TicTacToe
//
//  Created by Janelle Law on 2017-10-04.
//  Copyright © 2017 Janelle Law. All rights reserved.

import UIKit

class ViewController: UIViewController {

    var isPlayerX = true
    var scoreX = 0
    var scoreO = 0
    var filledBoxes = 0
    var ties = 0
    
    @IBOutlet weak var xScore: UILabel!
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var tieScore: UILabel!
   
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var TopL: UIButton!
    @IBOutlet weak var TopMid: UIButton!
    @IBOutlet weak var TopR: UIButton!
    @IBOutlet weak var MidL: UIButton!
    @IBOutlet weak var Centre: UIButton!
    @IBOutlet weak var MidR: UIButton!
    @IBOutlet weak var BottomL: UIButton!
    @IBOutlet weak var BottomMid: UIButton!
    @IBOutlet weak var BottomR: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        updateScore()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        filledBoxes += 1
        
        if isPlayerX == true {
            sender.setTitle("X", for: .normal)
            turnLabel.text = "O's turn"
        }
            
        else {
            sender.setTitle("O", for: .normal)
            turnLabel.text = "X's turn"
        }
        
        checkWins()
        
        isPlayerX = !isPlayerX
 
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func resetPoints(_ sender: Any) {
        scoreX = 0
        scoreO = 0
        ties = 0
        reset()
        updateScore()
    }
    
    
    func checkWins (){
        let top = TopL.currentTitle == TopMid.currentTitle && TopMid.currentTitle == TopR.currentTitle
      
        let midRow = MidL.currentTitle == Centre.currentTitle && MidR.currentTitle == Centre.currentTitle
       
        let bottom = BottomL.currentTitle == BottomMid.currentTitle && BottomR.currentTitle == BottomMid.currentTitle
        
        let left = TopL.currentTitle == MidL.currentTitle && MidL.currentTitle == BottomL.currentTitle
        
        let midColumn = TopMid.currentTitle == Centre.currentTitle && BottomMid.currentTitle == Centre.currentTitle
        
        let right = TopR.currentTitle == MidR.currentTitle && MidR.currentTitle == BottomR.currentTitle
        
        let diagonal1 = TopL.currentTitle == Centre.currentTitle && Centre.currentTitle == BottomR.currentTitle
        
        let diagonal2 = TopR.currentTitle == Centre.currentTitle && Centre.currentTitle == BottomL.currentTitle

        if(top || left || diagonal1){ //check top L corner for x or o
     
            if (TopL.currentTitle == "X"){
            turnLabel.text = "Player X Wins"
                scoreX += 1
                disableButtons()
            }
            
            if (TopL.currentTitle == "O") {
            turnLabel.text = "Player O Wins"
                scoreO += 1
                disableButtons()
            }
            
            updateScore()
        }
        
        else if (right || bottom){ //check bottom right corner for x or o
            
            if (BottomR.currentTitle == "X"){
                turnLabel.text = "Player X Wins"
                scoreX += 1
                disableButtons()
            }
            
            if (BottomR.currentTitle == "O") {
                turnLabel.text = "Player O Wins"
                scoreO += 1
                disableButtons()
            }
            updateScore()
        }
        
        else if (midRow || midColumn || diagonal2){ //check centre box for x or o
          
            if (Centre.currentTitle == "X"){
                turnLabel.text = "Player X Wins"
                scoreX += 1
                disableButtons()
            }
            
            if (Centre.currentTitle == "O") {
                turnLabel.text = "Player O Wins"
                scoreO += 1
                disableButtons()
            }
            updateScore()
        }
        
        else if (filledBoxes == 9){
            ties += 1
            turnLabel.text = "Tie"
            updateScore()
        }
        
    } //end checkWins
    
    func updateScore() {
        xScore.text = "X's Score: \(scoreX)"
        oScore.text = "O's Score: \(scoreO)"
        tieScore.text = "Ties: \(ties)"
    }
    
    func disableButtons(){
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    func reset() {
   
    for button in buttons {
    button.isEnabled = true
    button.setTitle("", for: .normal)
        }
        
        if isPlayerX {
        turnLabel.text = "X's Turn"
        } else {
        turnLabel.text = "O's Turn"
        }
        
        filledBoxes = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
/*  if (top || midRow || bottom || left || midColumn || right || diagonal1 || diagonal2){
 
 
 turnLabel.text = "Player X Wins"
 scoreX += 1
 disableButtons()
 }
 
 if (TopL.currentTitle == "O") {
 turnLabel.text = "Player O Wins"
 scoreO += 1
 disableButtons()
 }
 } */
