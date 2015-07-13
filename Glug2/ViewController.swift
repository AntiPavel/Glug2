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
    
    // Mark test instanse
    var angryFish3 = AngryFish(coordinates: 45, image: "⚫️", dir: .Down)
    var angryFish2 = AngryFish(coordinates: 183, image: "⚫️", dir: .Left)
    var angryFish = AngryFish(coordinates: 309, image: "⚫️", dir: .Right)
    var hero = Hero(coordinates: 12, turn: .Left)
    
    // View elements
    
    @IBOutlet weak var Text: UITextView!
    
    
    @IBAction func Up(sender: AnyObject) {
          hero.heroMove(.Up)
    }
    
    @IBAction func Down(sender: AnyObject) {
        hero.heroMove(.Down)
    }
    
    @IBAction func Left(sender: AnyObject) {
        hero.heroMove(.Left)
    }
    
    @IBAction func Right(sender: AnyObject) {
        hero.heroMove(.Right)
    }
    
    //Veiw didLoad with update view timer
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    func update() {

        angryFish3.angryFishMove()
        angryFish2.angryFishMove()
        angryFish.angryFishMove()
        printView()
        
    }
    
    // Mark view creator
    
    func printView() {
        var gameView = ""
        
        for i in 1...400 {

            switch (true) {
            case i == angryFish3.coordinates: gameView = gameView + angryFish3.image
            case i == angryFish2.coordinates: gameView = gameView + angryFish2.image
            case i == angryFish.coordinates: gameView = gameView + angryFish.image
            case i == hero.coordinates: gameView = gameView + hero.image
            default: gameView = gameView + "⚪️"
            }
        }
        
        Text.text! = gameView
    }

    // direction enum for all obj
    
    enum Direction {
        case Left
        case Right
        case Up
        case Down
    }
    
    enum Turn {
        case Left
        case Right
    }
    
    // Mark game char
    
    struct Hero {

        var image : String {
            switch turn {
            case .Left: return "🔙"
            case .Right: return "🔜"
            }
        }
        
        var coordinates : Int {
            didSet {
                switch true {
                case coordinates > 400: coordinates = oldValue
                case coordinates <= 0: coordinates = oldValue
                case coordinates % 20 == 0 && turn == .Left: coordinates = oldValue
                case (coordinates - 1) % 20 == 0  && turn == .Right: coordinates = oldValue
                default: break
                }
            }
        }
        
        var turn: Turn
        
        mutating func heroMove (step: Direction) {
            
            switch step {
            case .Left:   coordinates--
                turn = .Left
            case .Right:  coordinates++
                turn = .Right
            case .Up:     coordinates -= 20
            case .Down:   coordinates += 20
            default: break
            }
        }
        
    }
    
    // Mark computer char
    
    class AngryFish {
        
        var coordinates: Int {
            didSet {
                switch true {
                case coordinates > 400: coordinates = oldValue - 20
                    dir = .Up
                case coordinates <= 0: coordinates = oldValue + 20
                    dir = .Down
                case coordinates % 20 == 0 && dir == .Left: coordinates = oldValue + 1
                    dir = .Right
                case (coordinates - 1) % 20 == 0  && dir == .Right: coordinates = oldValue - 1
                    dir = .Left
                default: break
                }
            }
        }
        
        let image: String
        var dir : Direction
    
        init (coordinates: Int, image: String, dir: Direction) {
            self.coordinates = coordinates
            self.image = image
            self.dir = dir
        }
        
        func angryFishMove() {
            switch dir {
            case .Left:   coordinates--
            case .Right:  coordinates++
            case .Up:     coordinates -= 20
            case .Down:   coordinates += 20
            default: break
            }
        }
    }
}

