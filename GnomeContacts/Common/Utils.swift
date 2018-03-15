//
//  Utils.swift
//  GnomeContacts
//
//  Created by Joan Roig on 5/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit

// Funny way to determine genres.
func determineGenre(name: String) -> String {
    return name.count % 2 == 0 ? "♀" : "♂"
}

// Beautify the hair color description.
func randomDescription(text: String, hairColor: String) -> String {
    let tc = text.count
    let c1 = ["This", "Hey, this", "That", "Uh, that", "Yeah, this", "Yup, that"]
    let c2 = ["gnome", "user", "sexy gnome", "gorgeous gnome", "superb gnome", "superior gnome"]
    let c3 = ["is", "seems", "looks", "feels"]
    let c4 = ["a good one", "great", "lovely", "adorable", "cool", "magical", "good", "spectacular", "amazing", "excellent"]
    let c5 = [";)", "!!!", "!", ":)", ":D", ":3"]

    return "\(c1[tc%c1.count]) \(hairColor.lowercased())-haired \(c2[tc%c2.count]) \(c3[tc%c3.count]) \(c4[tc%c4.count]) \(c5[tc%c5.count])"
}

// Get the proper UIColor for a hair color.
func getColorFromHairColor(hairColor : hairColor) -> UIColor {
    switch hairColor {
    case .Pink:
        return .gnomePink
    case .Red:
        return .gnomeRed
    case .Green:
        return .gnomeGreen
    case .Black:
        return .gnomeBlack
    case .Gray:
        return .gnomeGray
    }
}


// Convert Hexadecimal colors to UIColors.
func UIColorFromRGB(colorCode: String, alpha: Float = 1.0) -> UIColor {
    let scanner = Scanner(string:colorCode)
    var color:UInt32 = 0;
    scanner.scanHexInt32(&color)
    
    let mask = 0x000000FF
    let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
    let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
    let b = CGFloat(Float(Int(color) & mask)/255.0)
    
    return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
}

// Show a shadow under the view.
extension UIView {
    func shadow(_ opacity : Opacity = .Normal) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = opacity.rawValue
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.masksToBounds = false
    }
    
    func glow(_ opacity : Opacity = .Normal) {
        shadow(opacity)
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    enum Opacity : Float {
        case Light = 0.2
        case Normal = 0.5
        case Heavy = 0.8
    }
    
}

// Show and hide loading spinners in the view
func showLoadingSpinner(_ view : UIViewController){
    let alert = UIAlertController(title: nil, message: "Loading data...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    loadingIndicator.startAnimating();
    alert.view.addSubview(loadingIndicator)
    view.present(alert, animated: true, completion: nil)
}

func hideLoadingSpinner(_ view : UIViewController){
    view.dismiss(animated: false, completion: nil)
}

// Show connection error alert (after dismissing the previous loading spinner)
func showConnectionError(_ view : UIViewController) {
    view.dismiss(animated: true) {
        let alert = UIAlertController(title: "Error", message: "Connection failiure", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
}

