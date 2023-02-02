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
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    
    var updatedMileage: Float = 0
    var startMileage: Float = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        oilNameLabel.text = UserDefaults.standard.string(forKey: "oilName")
        oilVolumeLabel.text = UserDefaults.standard.string(forKey: "oilVolume")
        dateOfChangeLabel.text = UserDefaults.standard.string(forKey: "dateOfChange")
        currentMileageLabel.text = UserDefaults.standard.string(forKey: "mileage")
        nextMileageLabel.text = UserDefaults.standard.string(forKey: "nextMileageLabel")
        let dif = UserDefaults.standard.float(forKey: "difference")
        progressView.setProgress(dif, animated: true)
        
    }
   
    
    @IBAction func changeOilButton() {
    }
    // MARK: update mileage button
    
    @IBAction func updateMileageButton() {
        
        let alertController = UIAlertController(title: "Обновить пробег", message: "Укажите текущий пробег", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { action in
            let textField = alertController.textFields?.first
            if let upd = textField?.text {
                if let intUpd = Float(upd) {
                    self.updatedMileage = intUpd
                }
            }
            let difference = self.updatedMileage - self.startMileage
            let factor: Float = difference/10000
            UserDefaults.standard.set(factor, forKey: "difference")
            self.progressView.setProgress(factor, animated: true)
            print(self.updatedMileage)
            print(self.startMileage)
            print(difference)
            print(factor)
        }
        
        alertController.addTextField()
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
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
        startMileage = Float(source.mileage) ?? 0
        
        self.progressView.setProgress(0, animated: true)
        }
    }
    
