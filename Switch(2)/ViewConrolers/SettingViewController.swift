//
//  ViewController.swift
//  Switch(2)
//
//  Created by Елизавета Медведева on 14.05.2023.
//

import UIKit

protocol ColorViewContrrollerDelegate: AnyObject {
    func setColor(_ color: RGBColor)
}

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
    /*
    private var color = RGBColor(
        redColor: 0,
        greenColor: 0,
        blueColor: 0,
        alfa: 0.5
    ) {
        didSet {
            
        }
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setSlider()
        colorView.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let colorVC = navigationVC.topViewController as? ColorViewController else {
            return
        }
        //colorVC.delegate = self
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
    
    private func string(from color: UISlider ) -> String {
        String(format: "%.1f", color.value)
    }
    
}

// MARK: - SettingsViewControllerDelegate
extension SettingViewController: ColorViewContrrollerDelegate {
    func setColor(_ color: RGBColor) {
        self.color = color
    }
}
