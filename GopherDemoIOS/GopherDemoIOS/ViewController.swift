//
//  ViewController.swift
//  GopherDemoIOS
//
//  Created by Tomasen on 4/7/16.
//  Copyright © 2016 tomasen.org. All rights reserved.
//

import UIKit
import GopherKit

class ViewController: UIViewController, GoGopherKitCallback {

    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var NanoCounter: UILabel!
    @IBOutlet weak var NanoTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pressedStartButton(sender: AnyObject) {
        GoGopherKitRegisterCallback(self)
        GoGopherKitStart()
        mainButton.hidden = true
    }
    
    func stateDidUpdate() {
        dispatch_async(dispatch_get_main_queue()) {
            let state = GoGopherKitGetState()
            if state.message() != "" && self.NanoCounter.text != state.message() {
                self.NanoCounter.text = state.message()
            }
            self.NanoTimeLabel.text = String(state.nanoTimeStamp())
        }
    }
}

