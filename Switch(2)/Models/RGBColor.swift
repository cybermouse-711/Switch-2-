//
//  RGBColor.swift
//  Switch(2)
//
//  Created by Елизавета Медведева on 30.05.2023.
//


struct RGBColor {
    
    var redColor: Double
    var greenColor: Double
    var blueColor: Double
    var alfa: Double
    
  /*
    static func getColorInt() {
        
        switch _ {
        case .red:
            String(format: "%.1f", redColor)
        case .green:
            String(format: "%.1f", greenColor)
        case .blue:
            String(format: "%.1f", blueColor)
        }
    }
    */
    
    enum Color {
        case red
        case green
        case blue
    }
    
}
