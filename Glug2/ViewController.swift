//
//  ViewController.swift
//  Glug2
//
//  Created by Павел Антонов on 11.07.15.
//  Copyright (c) 2015 Павел Антонов. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var x = 41
    var y = 1
    var z = -1
    
    
    var arrayView = [[String]]()
    var row = [String]()
   
    @IBOutlet weak var Text: UITextView!
    
    @IBAction func Go(sender: AnyObject) {
        
        y = 2
        
        move()

        Text.text! = ""
        
        viewDidLoad()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if y == 1 {
            didArrayView()
        }
        
        printView()

    }
    
    
    func didArrayView() {
     
        for i in 0...9 {
 
            for j in 0...11 {
               
                row.append("⚪️")
                
            }
            arrayView.append(row)
           
        }
    }

    func printView() {
        
            var countRow = 0

            for i in row {
                
                countRow++
                
                if countRow == x {
                    
                    Text.text! +=  "🐠"
                    
                } else {
                        Text.text! += i
                    }
            
                if countRow % 10 == 0 {
                    Text.text! += "\n"
                }
            }
                
            
        }
    
    func move() {
        
        
        if (x - 1) % 10 == 0 {
            
            z = z * -1
        }
        if x  % 10 == 0 {
            
            z = z * -1
        }

        x += z
    }
    
}


