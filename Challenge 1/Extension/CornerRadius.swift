//
//  CornerRadius.swift
//  Challenge 1
//
//  Created by Zacky Ilahi Azmi on 11/04/22.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
       get { return self.cornerRadius }
        set { self.layer.cornerRadius = newValue}
    }
}
