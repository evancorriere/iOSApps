//
//  ViewController.swift
//  AnimationSample
//
//  Created by Evan Corriere on 1/20/19.
//  Copyright © 2019 Evan Corriere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var animateBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func animateAction(_ sender: Any) {
        let overallDuration: Double = 2
        let viewToAnimate = animateBtn
        
        UIView.animateKeyframes(withDuration: overallDuration,
                                delay: 0,
                                options: [.calculationModeLinear],
                                animations: {
        
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.33, animations: {
                viewToAnimate?.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi/2))
                
            })
                                    
                                    
                                    
                                    
                                    
                                    
        }) { (done) in
            print("done!")
        }
        
        
    }
    
}

