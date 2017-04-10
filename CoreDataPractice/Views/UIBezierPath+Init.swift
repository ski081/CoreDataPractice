//
//  UIBezierPath+Init.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/10/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIBezierPath {
    convenience init(points: [CGPoint]) {
        self.init()
        if points.count > 0 {
            move(to: points[0])
            for p in points[1..<points.count] {
                addLine(to: p)
            }
            close()
        }
    }
}
