//
//  ViewController.swift
//  Glug2
//
//  Created by Павел Антонов on 11.07.15.
//  Copyright (c) 2015 Павел Антонов. All rights reserved.
//

import UIKit

extension String {
    
    mutating func insert(string: String, atIndex idx: Int) {
        let i = advance(self.startIndex, idx)
        let range = Range(start: i, end: i)
        self.removeAtIndex(i)
        self.replaceRange(range, with: string)
    }
    
    mutating func insertWithoutDelete(string: String, atIndex idx: Int) {
        let i = advance(self.startIndex, idx)
        let range = Range(start: i, end: i)
        self.replaceRange(range, with: string)
    }
    
    }


class ViewController: UIViewController {
    
    var x = 113
    var x2 = 329
    var x3 = 175
    var z = -1
    var z2 = -1
    var z3 = -20

    @IBOutlet weak var Text: UITextView!
    
    @IBAction func Go(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    func update() {

        moveX()
        moveX2()
        moveX3()
        printView()
    }
    
    func printView() {
        var gameView = ""
        
        for i in 1...400 {

            switch (true) {
            case i == x: gameView = gameView + "⚫️"
            case i == x2: gameView = gameView + "⚫️"
            case i == x3: gameView = gameView + "⚫️"
            default: gameView = gameView + "⚪️"
            }
        }
        
        Text.text! = gameView
    }
    
    func moveX() {
        
        if (x - 1) % 20 == 0 {
            
            z = z * -1
        }
        if x  % 20 == 0 {
            
            z = z * -1
        }

        x += z
    }
    
    func moveX2() {
        
        if (x2 - 1) % 20 == 0 {
            
            z2 = z2 * -1
        }
        
        if x2  % 20 == 0 {
            
            z2 = z2 * -1
        }
        
        x2 += z2
    }
    
    func moveX3() {
        
        if x3 <= 20 {
            
            z3 = z3 * -1
        }
        
        if x3  >= 380 {
            
            z3 = z3 * -1
        }
        
        x3 += z3
    }

    enum Direction {
        case Left
        case Right
        case Up
        case Down
    }
    
    class AngryFish {
        var coordinates: Int
        let image: String
    
        init (coordinates: Int, image: String) {
            self.coordinates = coordinates
            self.image = image
        }
        func angryFishMove() {
            switch (true){

            default: break
            }
        }
    }
}

