//
//  MoodsTableViewController.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/7/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import UIKit
import CoreData

class MoodsTableViewController: UITableViewController,
                                SegueHandler {
    var managedObjectContext: NSManagedObjectContext!
    fileprivate var dataSource: TableViewDataSource<MoodsTableViewController>!
    fileprivate var observer: ManagedObjectObserver?
    
    enum SegueIdentifier: String {
        case showMoodDetail = "showMoodDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .showMoodDetail:
            guard let vc = segue.destination as? MoodDetailViewController else {
                fatalError("Wrong view controller type")
            }
            
            guard let mood = dataSource.selectedObject else {
                fatalError("Showing detail, but no selected row?")
            }
            
            vc.mood = mood
        }
    }
    
    fileprivate func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        let request = Mood.sortedFetchRequest
        request.fetchBatchSize = 20
        request.returnsObjectsAsFaults = false
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        dataSource = TableViewDataSource(tableView: tableView, cellIdentifier: "MoodCell", fetchedResultsController: frc, delegate: self)
    }
}

extension MoodsTableViewController: TableViewDataSource {
    func configure(_ cell: MoodTableViewCell, for object: Mood) {
        cell.configure(for: object)
    }
}
