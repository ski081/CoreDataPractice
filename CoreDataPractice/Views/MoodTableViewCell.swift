//
//  MoodTableViewCell.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/10/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import UIKit

class MoodTableViewCell: UITableViewCell {
    @IBOutlet weak var moodView: MoodView!
    @IBOutlet weak var label: UILabel!
}

extension MoodTableViewCell {
    func configure(for mood: Mood) {
        moodView.colors
    }
}
