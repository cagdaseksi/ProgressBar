//
//  ViewController.swift
//  ProgressBar
//
//  Created by cagdas on 11/04/2018.
//  Copyright © 2018 cagdas. All rights reserved.
//

import UIKit
import MKMagneticProgress

class ViewController: UIViewController {
    
    @IBOutlet var ring: MKMagneticProgress!
    @IBOutlet weak var ring1: UIProgressView!
    @IBOutlet weak var ring2: UIProgressView!
    @IBOutlet weak var ring3: UIProgressView!
    
    var seconds = 60
    var prog = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ring.setProgress(progress: 1, animated: true)
        ring.font = UIFont(name: "Helvetica" , size: 40)!
        runTimer()
    }
   
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
   }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //Send alert to indicate time's up.
        } else {
            seconds -= 1
            //ring.title = timeString(time: TimeInterval(seconds))
            ring.percentLabelFormat = String(seconds)
            //            labelButton.setTitle(timeString(time: TimeInterval(seconds)), for: UIControlState.normal)
            
            let completionPercentage = Int(((Float(60) - Float(seconds))/Float(60)) * 100)
            
            prog =  seconds / 1000
        
            print(completionPercentage)
            
            ring.setProgress(progress: CGFloat(Float(seconds)/Float(60)), animated: true)
        }
    }

}

