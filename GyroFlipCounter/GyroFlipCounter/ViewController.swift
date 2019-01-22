//
//  ViewController.swift
//  GyroFlipCounter
//
//  Created by Evan Corriere on 1/21/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import UIKit
import CoreMotion
import Foundation

class ViewController: UIViewController {

    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var xLbl: UILabel!
    @IBOutlet weak var yLbl: UILabel!
    @IBOutlet weak var zLbl: UILabel!
    
    let motionManager = CMMotionManager()
    var active = false
    let multiplier: Double = 0.01 / (2 * Double.pi)
    
    struct Tracker {
        var x: Double
        var y: Double
        var z: Double
    }
    
    struct FlipCounter {
        var x: Int
        var y: Int
        var z: Int
    }
    
    
    var tracker: Tracker = Tracker(x: 0.0,y: 0.0,z: 0.0)
    var counter: FlipCounter = FlipCounter(x: 0,y: 0,z: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(multiplier)
    }

    @IBAction func playAction(_ sender: Any) {
        if (active) {
            active = false
            motionManager.stopGyroUpdates()
            playBtn.setTitle("Start", for: .normal)
            counter.x = Int(tracker.x.rounded())
            counter.y = Int(tracker.y.rounded())
            counter.z = Int(tracker.z.rounded())
            
        
            xLbl.text = "X flips: \(counter.x)"
            yLbl.text = "Y flips: \(counter.y)"
            zLbl.text = "Z flips: \(counter.z)"
            
            tracker = Tracker(x: 0.0,y: 0.0,z: 0.0)
            counter = FlipCounter(x: 0,y: 0,z: 0)
            
        } else {
            active = true
            playBtn.setTitle("Stop", for: .normal)
            motionManager.gyroUpdateInterval = 0.01
            motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
                if let mydata = data {
                    //self.xTracker += 0.01 * (abs(mydata.rotationRate.x / (2 * Double.pi)))
                    self.tracker.x += abs(mydata.rotationRate.x) * self.multiplier
                    print(self.tracker.x)
                    self.tracker.y += abs(mydata.rotationRate.y) * self.multiplier
                    self.tracker.z += abs(mydata.rotationRate.z) * self.multiplier
                }
            }
            
        }
        
        
        
    }
    
}

