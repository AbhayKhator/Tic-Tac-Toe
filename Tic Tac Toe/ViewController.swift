//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Abhay Khator on 04/04/24.
//

import UIKit

class ViewController: UIViewController {

    
    enum Turn {
        case Noughet, Cross
        
    }
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var viewLabel: UILabel!
    
    var board = [UIButton]()
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var  Nouget = "O"
    var Cross = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        // Do any additional setup after loading the view.
    }
    
    func initBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        if(fullBoard()){
            resultAlert(title: "Draw")
        }
    }
    
    func resultAlert(title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        } ))
        
        self.present(ac, animated: true)
    }
    
    func resetBoard(){
        for button in board{
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        
        if(firstTurn == Turn.Noughet){
            firstTurn = Turn.Cross
            viewLabel.text = Cross
        }else if(firstTurn == Turn.Cross){
            firstTurn = Turn.Noughet
            viewLabel.text = Nouget
        }
        
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if button.title( for: .normal ) == nil {
                return false
            }
        }
        return true
    }
    
    
    func addToBoard(_ sender: UIButton){
        if( sender.title(for: .normal) == nil ){
            if(currentTurn == Turn.Noughet){
                sender.setTitle(Nouget, for: .normal)
                currentTurn = Turn.Cross
                viewLabel.text = Cross
            }else if(currentTurn == Turn.Cross){
                sender.setTitle(Cross, for: .normal)
                currentTurn = Turn.Noughet
                viewLabel.text = Nouget
            }
            sender.isEnabled = false
        }
        
    }

}

