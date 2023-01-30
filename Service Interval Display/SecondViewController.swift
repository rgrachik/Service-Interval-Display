//
//  SecondViewController.swift
//  Service Interval Display
//
//  Created by Роман Грачик on 24.01.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    var oilName = ""
    var oilVolume = ""
    var dateOfChange = ""
    var mileage = ""

    @IBOutlet weak var oilNameTextField: UITextField!
    
    @IBOutlet weak var oilVolumeTextField: UITextField!
    
    @IBOutlet weak var dateOfChangeTextField: UITextField!
    
    @IBOutlet weak var mileageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed() {
        UserDefaults.standard.set(oilName, forKey: "oilName")
        UserDefaults.standard.set(oilVolume, forKey: "oilVolume")
        UserDefaults.standard.set(dateOfChange, forKey: "dateOfChange")
        UserDefaults.standard.set(mileage, forKey: "mileage")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let safeOilName = oilNameTextField.text {
            oilName = safeOilName
        }
        if let safeOilVolume = oilVolumeTextField.text {
            oilVolume = safeOilVolume
        }
        if let safeDateOfChange = dateOfChangeTextField.text {
            dateOfChange = safeDateOfChange
        }
        if let safeMileage = mileageTextField.text {
            mileage = safeMileage
        }
    }
}

extension SecondViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == oilNameTextField {
            oilVolumeTextField.becomeFirstResponder()
        }
        else if textField == oilVolumeTextField {
            dateOfChangeTextField.becomeFirstResponder()
        }
        else if textField == dateOfChangeTextField {
            mileageTextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
