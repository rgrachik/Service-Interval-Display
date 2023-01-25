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
