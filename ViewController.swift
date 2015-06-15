//
//  ViewController.swift
//  tips
//
//  Created by Mac Bellingrath on 6/14/15.
//  Copyright (c) 2015 com.mbellingrath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    let tipChoices:[Double] = [0.05,0.10,0.15,0.20,0.25]
    

    @IBOutlet weak var pretipAmount: UITextField!
    
    @IBOutlet weak var tipPercent: UISegmentedControl!
    
    @IBOutlet weak var calculatedTipLabel: UILabel!
    
    @IBOutlet weak var calculatedTotalLabel: UILabel!
    
    
    @IBAction func calculateTipButtonPressed(sender: UIButton) {
        
        
        
        var preTipDouble = stringToDouble(pretipAmount.text)
    
        var tipIndex: Int? = tipPercent.selectedSegmentIndex
        
        println("Pre-tip amount = \(preTipDouble)")
        
        var calculatedTip = preTipDouble * tipChoices[tipIndex!]
        
        var calculatedTotal = calculatedTip + preTipDouble
            
        
       calculatedTipLabel.text = "$ " + doubleToString(calculatedTip)
       calculatedTotalLabel.text = "$ " + doubleToString(calculatedTotal)
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    
        self.pretipAmount.endEditing(true)
        
        return false
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pretipAmount.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stringToDouble (string:String) -> Double {
       
        var doubleValueFromString = Double((string as NSString).doubleValue)
        
        return doubleValueFromString
        
    }
    
    func doubleToString (double: Double)  -> String {
        var stringFromDouble = "\(double)"
        return stringFromDouble
    }


}

