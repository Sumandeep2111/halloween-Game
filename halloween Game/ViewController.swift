//
//  ViewController.swift
//  halloween Game
//
//  Created by MacStudent on 2019-10-31.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var images: UILabel!

   
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var point: UILabel!
    
 
    @IBOutlet var choices: [UIButton]!
    
    
    @IBOutlet weak var lives: UILabel!
    
    var stuff = [(String,String)]()
    var points = 0
    var live = 5
  
    var timer:Timer?
    var timeLeft = 5
    var isTimeRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stuff = [("Dog","🐶"),("Cat","🐱"),("Mice","🐭"),("Fox","🦊"),("Rooster","🐔"),("Panda","🐼"),("Pumpkin","🎃"),("Ghost","👻"),("Dice","🎲"),("Skelton","💀"),("Frog","🐸"),("Unicorn","🐗"),("Snake","🐍"),("Lizzard","🦎"),("Blowfish","🐡")]
        
        lives.text = "Lives:5"
        point.text = "Point:0"
      
       
        
    }
    func buttons(){
        let button = stuff.randomElement()!.0
        if choices[0].titleLabel?.text != button {
            choices[0].setTitle(stuff.randomElement()!.0, for: .normal)
            choices[1].setTitle(stuff.randomElement()!.0, for: .normal)
            choices[2].setTitle(stuff.randomElement()!.0, for: .normal)
            choices[3].setTitle(stuff.randomElement()!.0, for: .normal)
        }
    }
    
    @IBAction func Startbutton(_ sender: UIButton) {
         buttons()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (onTimerFires), userInfo: nil, repeats: true)
        images.text = stuff.randomElement()!.1
        
        if start.isHidden == true {
            start.isHidden = false
        }
        else {
            start.isHidden = true
        }
        
        
    }
    @objc func  onTimerFires(){
        timeLeft -= 1
        timeLabel.text = "\(timeLeft)"
        if timeLeft <= 0 {
            timer!.invalidate()
            timer = nil
        }
        
    }
    
    
   
}

