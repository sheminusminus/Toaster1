//
//  ToasterViewController.swift
//  BrokenToaster1
//
//  Created by Emily Kolar on 12/18/16.
//  Copyright © 2016 Emily Kolar. All rights reserved.
//

import UIKit

class ToasterViewController: UIViewController {
	 
	//---------------------------
	// MARK: properties
	//---------------------------
	
	// this data will be given to our toaster view controller from elsewhere
	// set it to a blank string for now, so if the user enters nothing, we don't crash
	var userName: String = ""
	
	// data we'll get from user, is set it to a default value of 0
	var numberOfToastsRequested: Int = 0
	
	// whether the toaster is broken, set to a default of not-broken
	var isBroken: Bool = false
	
	// max toasts that can be made at one time
	let numberOfSlotsForToast: Int = 4
	
	// ui objects
	@IBOutlet weak var userInput: UITextField!
	@IBOutlet weak var outputView: UITextView!
	@IBOutlet weak var greetingLabel: UILabel!

	//---------------------------
	// MARK: lifecycle functions
	//---------------------------
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// greet the user
		greetingLabel.text = "Hi \(user)!"
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	//---------------------------
	// MARK: methods/functions
	//---------------------------
	
	// returns a boolean for whether toaster has broken or not
	func randomlyBreakToaster() -> Bool {
		
		// generate a random number between 0 and 3 (will be 0, 1, or 2)
		let r = Int(arc4random_uniform(3) + 1)
		
		// break the toaster 1/3 of the time
		if r % 2 == 0 {
			return true
		}
		
		return false
	}
	
	func makeToast() {
		
		var currentSlot: Int = 1
		
		isBroken = true
		
		if (isBroken) {
			outputView.text = "Sorry, I can't make toast right now, I'm broken."
			return
		}
		
		// loop through number of requests while toaster isn't broken
		for i in 0...numberOfToastsRequested {
				
			outputView.text.append("\nFilling slot \(currentSlot) with toast \(i + 1).")
			currentSlot += 1
			
			// if slots are full of toast
			if (i + 1) % numberOfSlotsForToast == 0 || (i + 1) == numberOfToastsRequested {
				
				outputView.text.append("\n---> Trying to toast...")
				
				repeat {
					
					// sometimes my toaster breaks when i try to toast something
					isBroken = randomlyBreakToaster()
					
					if isBroken {
						outputView.text.append("\n[Toaster broke, trying to fix...]")
					}
					else {
						outputView.text.append("\n[Toasting...]")
					}
					
				} while isBroken
				
			}
		}
	}
	
	//---------------------------
	// MARK: actions (sent by storyboard objects)
	//---------------------------
	
	@IBAction func donePressed(_ sender: Any) {
		
		// clear ouput box first
		outputView.text.removeAll()
	
		// get the number of toasts requested
		numberOfToastsRequested = Int(userInput.text!)
		
		makeToast()
		
	}
	
}
