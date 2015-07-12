//
//  ViewController.swift
//  Glug2
//
//  Created by Павел Антонов on 11.07.15.
//  Copyright (c) 2015 Павел Антонов. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var x = 61
    var x2 = 129
    var x3 = 175
    var y = 1
    var z = -1
    var z2 = -1
    var z3 = -20

    
    var arrayView = [[String]]()
    var row = [String]()
   
    @IBOutlet weak var Text: UITextView!
    
    @IBAction func Go(sender: AnyObject) {
        
     /*   y = 2
        
        moveX()
        moveX2()
        moveX3()

        Text.text! = ""
        
        viewDidLoad()*/
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if y == 1 {
            didArrayView()
        }
        
        printView()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
    }
    
    func update() {
        y = 2
        
        moveX()
        moveX2()
        moveX3()
        
        Text.text! = ""
        
        printView()
       
    }
    
    
    func didArrayView() {
     
        for i in 0...19 {
 
            for j in 0...19 {
               
                row.append("⚪️")
                
            }
            arrayView.append(row)
           
        }
        
        Go(NSTimer)
        
    }

    func printView() {
        
            var countRow = 0

            for i in row {
                
                countRow++
                
                if countRow == x || countRow == x2 || countRow == x3 {
                    
                    Text.text! +=  "🐠"
                    
                } else {
                        Text.text! += i
                    }
            
                if countRow % 20 == 0 {
                    Text.text! += "\n"
                }
            }
                
            
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
    

}



