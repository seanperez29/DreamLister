//
//  MainVC.swift
//  DreamLister
//
//  Created by Sean Perez on 3/12/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var managedObjectContext: NSManagedObjectContext!
    lazy var fetchedResultsController: NSFetchedResultsController<Item> = {
        let fetchRequest = NSFetchRequest<Item>()
        let entity = Item.entity()
        fetchRequest.entity = entity
        let dateSort = NSSortDescriptor(key: "created", ascending: true)
        fetchRequest.sortDescriptors = [dateSort]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func performFetch() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }

}


extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension MainVC: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        guard let newIndexPath = newIndexPath else {
            print("Unable to obtain a newIndexPath")
            return
        }
        guard let indexPath = indexPath else {
            print("Unable to obtain an indexPath")
            return
        }
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath], with: .fade)
        case .delete:
            tableView.deleteRows(at: [newIndexPath], with: .fade)
        case .update:
            if let cell = tableView.cellForRow(at: indexPath) as? ItemCell {
                
            }
        case .move:
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
}

