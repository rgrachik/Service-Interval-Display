//
//  ViewController.swift
//  Service Interval Display
//
//  Created by Роман Грачик on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oilNameLabel: UILabel!
    
    @IBOutlet weak var oilVolumeLabel: UILabel!
    
    @IBOutlet weak var dateOfChangeLabel: UILabel!
    
    @IBOutlet weak var currentMileageLabel: UILabel!
    
    @IBOutlet weak var nextMileageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oilNameLabel.text = UserDefaults.standard.string(forKey: "oilName")
        oilVolumeLabel.text = UserDefaults.standard.string(forKey: "oilVolume")
        dateOfChangeLabel.text = UserDefaults.standard.string(forKey: "dateOfChange")
        currentMileageLabel.text = UserDefaults.standard.string(forKey: "mileage")
        nextMileageLabel.text = UserDefaults.standard.string(forKey: "nextMileageLabel")
    }
   
    
    @IBAction func changeOilButton() {
    }
    
    @IBAction func UnwindAction(unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "backToFirst" else {return}
        guard let source = unwindSegue.source as? SecondViewController else {return}
        oilNameLabel.text = source.oilName
        oilVolumeLabel.text = source.oilVolume
        dateOfChangeLabel.text = source.dateOfChange
        currentMileageLabel.text = source.mileage
        nextMileageLabel.text = String((Int(source.mileage) ?? 0) + 10000)
        UserDefaults.standard.set(nextMileageLabel.text, forKey: "nextMileageLabel")
        
        }
    }
    


