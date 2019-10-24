//
//  ViewController.swift
//  Welcome User
//
//  Created by Eric Crichlow on 7/1/19.
//  Copyright © 2019 Infusions of Grandeur. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

	@IBOutlet weak var greetingLabel: UILabel!
	@IBOutlet weak var nameInputField: UITextField!

	var firstName : UserModel?

	override func viewDidLoad()
	{
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBAction func done(_ sender: UIButton)
	{
		if let name = nameInputField.text
		{
			firstName = UserModel.init(withFirstName: name)
			greetUser()
		}
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool
	{
		if let name = nameInputField.text
		{
			firstName = UserModel.init(withFirstName: name)
			greetUser()
			return true
		}
		return false
	}

	func greetUser()
	{
		if let nameModel = firstName
		{
			greetingLabel.text = "Welcome, \(nameModel.firstName)"
		}
	}
}

