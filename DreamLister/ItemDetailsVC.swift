//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Sean Perez on 3/12/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    var managedObjectContext: NSManagedObjectContext!
    var stores = [Store]()
    var item: Item? {
        didSet {
            title = "Edit"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let topItem = navigationController?.navigationBar.topItem
        topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        let store = Store(context: managedObjectContext)
//        store.name = "Best Buy"
//        let store2 = Store(context: managedObjectContext)
//        store2.name = "Tesla Dealership"
//        let store3 = Store(context: managedObjectContext)
//        store3.name = "Frys Electronics"
//        let store4 = Store(context: managedObjectContext)
//        store4.name = "Target"
//        let store5 = Store(context: managedObjectContext)
//        store5.name = "Amazon"
//        let store6 = Store(context: managedObjectContext)
//        store6.name = "KMart"
//        do {
//            try managedObjectContext.save()
//        } catch {
//            print(error)
//        }
        performFetch()
    }
    
    func performFetch() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do {
            stores = try managedObjectContext.fetch(fetchRequest)
            storePicker.reloadAllComponents()
        } catch {
            print(error)
        }
    }

}

extension ItemDetailsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
