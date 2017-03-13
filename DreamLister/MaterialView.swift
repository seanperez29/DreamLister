//
//  MaterialView.swift
//  DreamLister
//
//  Created by Sean Perez on 3/12/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {

    @IBInspectable var materialDesign: Bool {
        get {
            return self.materialDesign
        } set {
            self.materialDesign = newValue
            if materialDesign {
                layer.masksToBounds = false
                layer.cornerRadius = 3.0
                layer.shadowOpacity = 0.8
                layer.shadowRadius = 3.0
                layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
            } else {
                layer.cornerRadius = 0
                layer.shadowOpacity = 0
                layer.shadowRadius = 0
                layer.shadowColor = nil
            }
        }
    }

}
