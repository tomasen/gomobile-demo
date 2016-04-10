//
//  ViewController.swift
//  GopherDemoOSX
//
//  Created by Tomasen on 4/7/16.
//  Copyright © 2016 tomasen.org. All rights reserved.
//

import Cocoa
import GopherKit

class ViewController: NSViewController, GoGopherKitCallback {

    @IBOutlet weak var nanoTimerLabel: NSTextField!
    @IBOutlet weak var nanoCounter: NSTextField!
    @IBOutlet weak var mainButton: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func mainButtonPressed(sender: AnyObject) {
        GoGopherKitRegisterCallback(self)
        GoGopherKitStart()
        mainButton.hidden = true
    }
    
    func stateDidUpdate() {
        dispatch_async(dispatch_get_main_queue()) {
            let state = GoGopherKitGetState()
            self.nanoCounter.stringValue = state.nanoCounter()
            self.nanoTimerLabel.stringValue = String(state.nanoTimeStamp())
        }
    }
}

