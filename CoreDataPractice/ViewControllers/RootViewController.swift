//
//  RootViewController.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/7/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import UIKit
import CoreData

class RootViewController: UIViewController, SegueHandler {
    var managedObjectContext: NSManagedObjectContext!

    enum SegueIdentifier: String {
        case embedNavigation = "embedNavigationController"
        case embedCamera = "embedCamera"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .embedNavigation:
            guard let navVC = segue.destination as? UINavigationController,
                let vc = navVC.viewControllers.first as? MoodsTableViewController else {
                fatalError("Unable to get moods vc")
            }
            
            vc.managedObjectContext = managedObjectContext
        default:
            break
        }
    }
}
