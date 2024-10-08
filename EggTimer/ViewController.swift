//
//  ViewController.swift
//  EggTimer
//
//  Created by Kartik Gautam on 06/04/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    let eggTimes = ["Soft": 3, "Medium": 7, "Hard":12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    
    @IBAction func hardnessSelection(_ sender: UIButton) {

        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
        
        timer =   Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    @objc func updateTimer() {
     if secondsPassed < totalTime {
         
         
         secondsPassed += 1
         progressBar.progress = Float(secondsPassed) / Float(totalTime)
        
            
        } else {
            timer.invalidate()
            titleLable.text = "DONE!"
        }
    }
}
