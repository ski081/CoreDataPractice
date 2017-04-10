//
//  AppDelegate.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/7/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var persistentContainer: NSPersistentContainer!
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        createMoodyContainer { container in
            self.persistentContainer = container
            let storyboard = self.window?.rootViewController?.storyboard
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "RootViewController") as? RootViewController else {
                fatalError("Cannot instantiate root VC")
            }
            
            vc.managedObjectContext = container.viewContext
            self.window?.rootViewController = vc
        }
        return true
    }


    func createMoodyContainer(completion: @escaping(NSPersistentContainer) -> ()) {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Failed to load store: \(String(describing: error))")
            }
            
            DispatchQueue.main.async {
                completion(container)
            }
        }
    }

}

