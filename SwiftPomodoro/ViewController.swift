//
//  ViewController.swift
//  SwiftPomodoro
//
//  Created by Sean Nam on 1/13/17.
//  Copyright © 2017 Sean Nam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var secondsLabel: UILabel!
    @IBOutlet var minutesLabel: UILabel!
    @IBOutlet var colonLabel: UILabel!
    @IBOutlet var msgLabel: UILabel!
    
    @IBOutlet var startButton: UIButton!

    var minutes = 25;
    var seconds = 00;
    var timer = Timer();
    var timerIsOn = false;
    
    var doneMessage = "DONE!";
    
    @IBAction func buttonPressed(sender: UIButton) { // start button
        if(msgLabel.text == doneMessage) {
            msgLabel.text = "";
            colonLabel.text = ":";
            
            minutes = 25;
            seconds = 00;
            updateLabels(minutes: minutes, seconds: seconds)
        }
        
        if(timerIsOn == false) { // false means off, true means on
            //sender.setTitle("PAUSE", for: .normal);
            startTimer()
        }
        else {
            //sender.setTitle("START", for: .normal);
            stopTimer()
        }
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        stopTimer()
        if(timerIsOn == false) {
            minutes = 25;
            seconds = 00;
    
            updateLabels(minutes: minutes, seconds: seconds)
        }
    }
    
    func updateLabels(minutes: Int, seconds: Int) {
        minutesLabel.text = String(format: "%02d", minutes);
        secondsLabel.text = String(format: "%02d", seconds);
    }
    
    func updateTimer() {
        if (seconds > 0 && minutes >= 0) {
            seconds -= 1;
        }
        
        if ( minutes > 0 && seconds == 0) {
            minutes -= 1;
            seconds = 59;
        }
        updateLabels(minutes: minutes, seconds: seconds)
        
        if ( minutes == 0 && seconds == 0) {
            minutes = 00;
            seconds = 00;
            stopTimer()
            
            colonLabel.text = "";
            minutesLabel.text = "";
            secondsLabel.text = "";
            msgLabel.text = doneMessage;
        }
        
    }

    func startTimer() {
        startButton.setTitle("PAUSE", for: .normal);
        // timeInterval - per sec, selector - function to call
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true);
        timerIsOn = true;
    }
    
    func stopTimer() {
        startButton.setTitle("START", for: .normal);
        timer.invalidate()
        timerIsOn = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        minutesLabel.text = String(format: "%02d", minutes);
        secondsLabel.text = String(format: "%02d", seconds);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

