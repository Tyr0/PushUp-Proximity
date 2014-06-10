//
//  ViewController.swift
//  PushUp Proximity
//
//  Created by Tyler Calderone on 6/10/14.
//  Copyright (c) 2014 Tyler Calderone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textLabel: UILabel?
    
    var count:UInt = 0 {
    didSet {
        textLabel!.text = String(self.count)
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register for proximity state changes
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "proximityChanged:", name: "UIDeviceProximityStateDidChangeNotification", object: nil)

        // enable proximity monitoring
        UIDevice.currentDevice().proximityMonitoringEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: NSNotificationCenter Observers
    
    func proximityChanged(notification: NSNotification) {
        // if proximity is currently down, increment count
        if (UIDevice.currentDevice().proximityState) {
            count++
        }
    }
    
    // MARK: Interface Builder Methods
    
    @IBAction func resetCounter(sender: AnyObject?) {
        count = 0;
    }
    
    // MARK: Teardown
    
    deinit {
        // stop proximity monitoring
        UIDevice.currentDevice().proximityMonitoringEnabled = false

        // stop observing notifications
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

