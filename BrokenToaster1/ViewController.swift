//
//  ViewController.swift
//  BrokenToaster1
//
//  Created by Emily Kolar on 12/18/16.
//  Copyright © 2016 Emily Kolar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	//---------------------------
	// MARK: properties
	//---------------------------
	
	// data we will get from user
	var name: String!
	
	// ui (storyboard objects)
	@IBOutlet weak var userInput: UITextField!

	//---------------------------
	// MARK: lifecycle functions
	//---------------------------
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	//---------------------------
	// MARK: actions (sent by storyboard objects)
	//---------------------------

	@IBAction func donePressed(_ sender: Any) {
		
		name = userInput.text!
		
		// get a reference to our storyboard
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		// create a ToasterViewController in memory, using a reference to our storyboard view controller
		let toasterVC = storyboard.instantiateViewController(withIdentifier: "toasterVC") as! ToasterViewController
		
		// set the user's name variable inside our toasterVC so it knows that information
		toasterVC.userName = self.name
		
		// present the toaster view controller graphically, in the ui
		self.present(toasterVC, animated: true, completion: nil)
	}

}

