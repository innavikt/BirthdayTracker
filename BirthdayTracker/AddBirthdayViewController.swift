//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by inna on 06/05/2019.
//  Copyright © 2019 inna. All rights reserved.
//

import UIKit
import CoreData


    
class AddBirthdayViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var birthDayPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthDayPicker.maximumDate = Date()
        
    }

    @IBAction func saveBirthday(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? "FirstName Placeholder"
        let lastName = lastNameTextField.text ?? "LastName Placeholder"
        let birthdate = birthDayPicker.date
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let birthday = Birthday(context: context)
        birthday.lastName = lastName
        birthday.firstName = firstName
        birthday.birthdate = birthdate
        birthday.birthdayID = UUID().uuidString
        
        if let uniqueId = birthday.birthdayID {
            print("The birthday id is \(uniqueId)")
        }
        
        do {
            try context.save()
        } catch let error {
            print("Can't save: \(error)")
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelBirthday(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

