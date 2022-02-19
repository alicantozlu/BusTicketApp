//
//  UITextField+Extension.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 20.02.2022.
//

import UIKit

extension UITextField{
    func underLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor(red: 0, green: 31/255, blue: 91/255, alpha: 1).cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
