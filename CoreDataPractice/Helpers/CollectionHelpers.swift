//
//  CollectionHelpers.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/10/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: AnyObject {
    func containsObjectIdentical(to object: AnyObject) -> Bool {
        return contains { $0 === object }
    }
}

extension Array {
    var decomposed: (Iterator.Element, [Iterator.Element])? {
        guard let x = first else { return nil }
        return (x, Array(self[1..<count]))
    }
}
