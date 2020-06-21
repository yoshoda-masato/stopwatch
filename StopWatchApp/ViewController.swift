//
//  ViewController.swift
//  StopWatchApp
//
//  Created by 吉田 将人 on 2019/10/04.
//  Copyright © 2019 吉田 将人. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countNum = 0
    var timerRunning = false
    var timer = Timer()
    
    @objc func updateDisplay(){
        
        countNum += 1
        let ms = countNum % 100
        let s = (countNum - ms) / 100 % 60
        let m = (countNum - s - ms) / 6000 % 3600
        timerLabel.text = String(format: "%02d:%02d.%02d", m,s,ms)
        
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func startTimer(_ sender: Any) {
        
        if timerRunning == false{
            
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.updateDisplay), userInfo: nil, repeats: true)
            timerRunning = true
        }

    }
    
    @IBAction func stopButton(_ sender: Any) {
        
        if timerRunning == true{
            
            timer.invalidate()
            timerRunning = false
            
        }
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        
        countNum = 0
        timerLabel.text = "00:00:00"
        
    }

    
}

