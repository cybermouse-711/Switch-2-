//
//  RGBColor.swift
//  Switch(2)
//
//  Created by Елизавета Медведева on 30.05.2023.
//

import UIKit


struct RGBColor {
    
    var redColor: Float 
    var greenColor: Float
    var blueColor: Float
    var alfa: Float
    
    func string(_ color: UISlider ) -> String {
        String(format: "%.1f", color.value)
    }
    
    func setColorRGB(redColor: Float, greenColor: Float, blueColor: Float, alfa: Float) -> UIColor {
        UIColor(
            red: CGFloat(redColor),
            green: CGFloat(greenColor),
            blue: CGFloat(blueColor),
            alpha: CGFloat(alfa)
        )
    }
}
