//
//  TableViewDataSource.swift
//  CoreDataPractice
//
//  Created by Struzinski, Mark - Mark on 4/10/17.
//  Copyright © 2017 lowes. All rights reserved.
//

import UIKit
import CoreData

protocol TableViewDataSourceDelegate: class {
    associatedtype Object: NSFetchRequestResult
    associatedtype Cell: UITableViewCell
    func configure(_ cell: Cell, for object: Object)
}

class TableViewDataSource<Delegate: TableViewDataSourceDelegate>: NSObject,
                                                                    UITableViewDataSource,
                                                                    NSFetchedResultsControllerDelegate {
    typealias Object = Delegate.Object
    typealias Cell = Delegate.Cell
    
    fileprivate let tableView: UITableView
    fileprivate let fetchedResultsController: NSFetchedResultsController<Object>
    fileprivate weak var delegate: Delegate!
    fileprivate let cellIdentifier: String
    
    required init(tableView: UITableView,
                  cellIdentifier: String,
                  fetchedResultsController: NSFetchedResultsController<Object>,
                  delegate: Delegate) {
        self.tableView = tableView
        self.cellIdentifier = cellIdentifier
        self.fetchedResultsController = fetchedResultsController
        self.delegate = delegate
        super.init()
        fetchedResultsController.delegate = self
        try! fetchedResultsController.performFetch()
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    // MARK: - TableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else {
            return 0
        }
        
        return section.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = fetchedResultsController.object(at: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? Cell else {
            fatalError("Unexpected cell type at \(indexPath)")
        }
        
        delegate.configure(cell, for: object)
        return cell
    }
}
