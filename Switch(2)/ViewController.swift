//
//  ViewController.swift
//  Switch(2)
//
//  Created by Елизавета Медведева on 14.05.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var BlueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setSlider()
      
        colorView.layer.cornerRadius = 15
    }

    @IBAction func actionSlider(_ sender: UISlider) {
        setView()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
        }
    }
    
    
    private func setSlider() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func setView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 0.5
        )
    }
    
    private func string(from slider: UISlider ) -> String {
        String(format: "%.1f", slider.value)
    }
    
}

