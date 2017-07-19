//
//  ViewController.swift
//  beepTest
//
//  Created by Sky Xu on 7/18/17.
//  Copyright © 2017 Sky Xu. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    var SwiftTimer = Timer()
    var SwiftCounter = 0
    let placeholder = "00:00"
    var cycle = 0
    let dataChart : [Int: (shuttle: Int,shuttleTime: Double)] = [
        1: (7,9.0),
        2: (8,8.0),
        3: (8,7.58),
        4: (9,7.2),
        5: (9,6.86),
        6: (10,6.55),
        7: (10,6.26),
        8: (11,6.0),
        9: (11,5.76),
        10: (11,5.54),
        11: (12,5.33),
        12: (12,5.14),
        13: (13,4.97),
        14: (13,4.8),
        15: (13,4.65),
        16: (14,4.5),
        17: (14,4.36),
        18: (15,4.24),
        19: (15,4.11),
        20: (16,4.0),
        21: (16,3.89)
    ]
    
    var shuttle: Int?
    var shuttleTime: Double?
    var countDown: Double? //remaining shuttleTime
    var centiseconds: Double? = 9
    var seconds: Int?
    
    @IBOutlet weak var nextLevelButton: UIButton!
    @IBOutlet weak var clockImage: UIImageView!
    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var buttonGo: UIButton!
    
    @IBAction func nextLevelButtonTapped(_ sender: UIButton) {
    }
    @IBAction func goButtonTapped(_ sender: UIButton) {
        if buttonStop.isHidden {
            buttonStop.isHidden = false
            SwiftTimer = Timer.scheduledTimer(timeInterval: 0.05, target:self, selector: "updateCounter", userInfo: nil, repeats: true)
            
        } else {
            buttonStop.isHidden = true
        }
        
    }
    @IBOutlet weak var buttonStop: UIButton!
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        SwiftTimer.invalidate()
        cycle += 1
        print(cycle)
        countingLabel.text = "00:00"
        
    }
    
    func updateCounter() {
        
        if Int(countDown!) > 0 {
        countDown = countDown! - 0.05
        seconds = Int(countDown!)
            print(seconds)
        centiseconds = (countDown! - Double(seconds!)) * 100
            print(Int(centiseconds!))
        var description: String {
            return NSString(format: "%02d:%02d", seconds!, centiseconds!) as String
        }
        countingLabel.text = "\(description)"
        } 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//            for i in level{run the updateCounter 'shuttle' times}
            let chartEntry = dataChart[1]
            countDown = chartEntry!.shuttleTime
            print(countDown)
        
        
        buttonGo.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        buttonGo.layer.cornerRadius = buttonGo.frame.width / 2
        buttonGo.layer.masksToBounds = true
        buttonStop.frame = CGRect(x: 20, y: 60, width: 50, height: 50)
        buttonStop.layer.cornerRadius = 0.5 * buttonGo.frame.width
        buttonStop.layer.masksToBounds = true
        buttonStop.layer.borderWidth = 3
        buttonStop.layer.borderColor = UIColor.white.cgColor
        buttonStop.isHidden = true
        clockImage.frame = CGRect(x: 260, y: 200, width: 200, height: 200)
        clockImage.layer.cornerRadius = clockImage.frame.width / 2
        clockImage.layer.masksToBounds = true
        clockImage.layer.borderWidth = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

