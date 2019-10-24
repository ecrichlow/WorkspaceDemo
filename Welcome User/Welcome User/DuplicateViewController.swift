//
//  DuplicateViewController.swift
//  Welcome User
//
//  Created by Eric Crichlow on 7/2/19.
//  Copyright © 2019 Infusions of Grandeur. All rights reserved.
//

import UIKit

class DuplicateViewController: UIViewController, UITextFieldDelegate
{

	@IBOutlet weak var nameInputField: UITextField!
	@IBOutlet weak var greetingLabel: UILabel!

	var firstName : UserModel?

	override func viewDidLoad()
	{
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

	/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
