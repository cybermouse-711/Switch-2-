//
//  RGBColor.swift
//  Switch(2)
//
//  Created by Елизавета Медведева on 30.05.2023.
//


struct RGBColor {
    
    var redColor: Int
    var greenColor: Int
    var blueColor: Int
    
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
