//
//  ViewController.swift
//  FibonacciApp
//
//  demo branch
//
//  Created by Chris on 11/17/16.
//  Copyright © 2016 CHN. All rights reserved.
//

import UIKit
import DeviceKit

class ViewController: UIViewController {

    var fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: 2, includesZero: true)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateFibonacciSequence()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   
    }
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var numberOfItemsSlider: UISlider!
    @IBOutlet weak var includesZeroSwitch: UISwitch!
    @IBOutlet weak var includesZeroLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    @IBAction func updateFibonacciSequence()
    {
    
        let device = Device()
        print(device) // prints, for example, "iPhone 6 Plus"
        
        let groupOfAllowedDevices: [Device] = [.iPhone5s, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus,.simulator(.iPhone5s), .simulator(.iPhone6), .simulator(.iPhone6Plus), .simulator(.iPhone6s), .simulator(.iPhone6sPlus)]
        
        if device.isOneOf(groupOfAllowedDevices) {
            
        if includesZeroSwitch.isOn
        {
            numberOfItemsSlider.maximumValue = 94
        }
        else
        {
            numberOfItemsSlider.maximumValue = 93
        }
    }
    else
    {
        if includesZeroSwitch.isOn
        {
            numberOfItemsSlider.maximumValue = 48
        }
        else
        {
            numberOfItemsSlider.maximumValue = 47
        }
    }
    fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: UInt(numberOfItemsSlider.value), includesZero: includesZeroSwitch.isOn)
    
    textView.text = fibonacciSequence.values.description
    
    numberOfItemsLabel.text = String(Int(numberOfItemsSlider.value))
    
    if includesZeroSwitch.isOn == true
    {
    includesZeroLabel.text = "Yes"
    }
    
    else
    {
    includesZeroLabel.text = "No"
    }
        
    }
    
}
