//
//  SegueHandler.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/7/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import UIKit
import UIKit

protocol SegueHandler {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                fatalError("Unknown segue: \(segue))")
        }
        
        return segueIdentifier
    }
    
    func performSegue(withIdentifier segueIdentifier: SegueIdentifier) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil)
    }
}
