//
//  Mood.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/7/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import UIKit
import CoreData

final class Mood: NSManagedObject {
    @NSManaged fileprivate(set) var date: Date
    @NSManaged fileprivate(set) var colors: [UIColor]
}

extension Mood: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: #keyPath(date),
                                 ascending: false)
        ]
    }
}
