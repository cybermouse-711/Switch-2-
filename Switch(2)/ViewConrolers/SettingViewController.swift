//
//  ViewController.swift
//  Switch(2)
//
//  Created by Елизавета Медведева on 14.05.2023.
//

import UIKit

final class SettingViewController: UIViewController {

    
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
    
    var color: RGBColor!
    unowned var delegate: SettingViewContrrollerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegete()
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
    
    @IBAction func doneButton(_ sender: UIButton) {
        view.endEditing(true)
        delegate.setColor(color)
        dismiss(animated: true)
    }
    
    private func setSlider() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func setDelegete(){
        redSlider.delegate = self
        greenSlider.delegate = self
        blueSlider.delegate = self
    }
    
    private func setView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 0.5
        )
    }
    
    private func string(from color: UISlider ) -> String {
        String(format: "%.1f", color.value)
    }
    
}

// MARK: - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = textField.text else { return }
        guard let numberValue = Double(value) else { return }
        
        switch textField {
        case redSlider:
            redSlider.value = Float(numberValue)
        case greenSlider:
            greenSlider.value = Float(numberValue)
        default:
            blueSlider.value = Float(numberValue)
        }
    }
}
