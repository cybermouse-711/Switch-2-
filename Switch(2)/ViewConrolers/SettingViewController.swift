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
    @IBOutlet var blueTextField: UITextField!
    
    var color: RGBColor!
    var delegate: SettingViewContrrollerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setLabel()
        setTextField()
        colorView.layer.cornerRadius = 15
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func actionSlider(_ sender: UISlider) {
        setView()
        switch sender {
        case redSlider:
            redLabel.text = color.string(sender)
            redTextField.text = color.string(sender)
        case greenSlider:
            greenLabel.text = color.string(sender)
            greenTextField.text = color.string(sender)
        default:
            blueLabel.text = color.string(sender)
            blueTextField.text = color.string(sender)
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        view.endEditing(true)
        delegate.setColor(for: color)
        dismiss(animated: true)
    }
    
    private func setLabel() {
        redLabel.text = color.string(redSlider)
        greenLabel.text = color.string(greenSlider)
        blueLabel.text = color.string(blueSlider)
    }
    
    private func setTextField() {
        redTextField.text = color.string(redSlider)
        greenTextField.text = color.string(greenSlider)
        blueTextField.text = color.string(blueSlider)
    }
    
    private func setView() {
        colorView.backgroundColor = color.setColorRGB(
            redColor: redSlider.value,
            greenColor: greenSlider.value,
            blueColor: blueSlider.value,
            alfa: 0.5
        )
    }
}

// MARK: - Private Methods
private extension SettingViewController {
    func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = textField.text else { return }
        guard let numberValue = Float(value) else { return }
        
        switch textField {
        case redTextField:
            redSlider.value = numberValue
        case greenTextField:
            greenSlider.value = numberValue
        case blueTextField:
            blueSlider.value = numberValue
        default:
            showAlert(title: "Ошибка!", message: "Введите число")
        }
    }
}


