//
//  ColorViewController.swift
//  Switch(2)
//
//  Created by Елизавета Медведева on 30.05.2023.
//

import UIKit

protocol SettingViewContrrollerDelegate: AnyObject {
    func setColor(_ color: RGBColor)
}

final class ColorViewController: UIViewController {

    private var color = RGBColor(
        redColor: 0,
        greenColor: 0,
        blueColor: 0,
        alfa: 0.5
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.color = color
        settingVC.delegate = self
    }

    @IBAction func settingButton(_ sender: UIBarButtonItem) {
    }
}

// MARK: - SettingViewContrrollerDelegate
extension ColorViewController: SettingViewContrrollerDelegate {
    func setColor(_ color: RGBColor) {
       self.color = color
    }
}
