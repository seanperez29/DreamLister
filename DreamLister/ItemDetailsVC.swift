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
    var itemToEdit: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            setItemToEditData(item: item)
        }
        let topItem = navigationController?.navigationBar.topItem
        topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
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
    
    func setItemToEditData(item: Item) {
        title = "Edit"
        titleField.text = item.title
        priceField.text = String(item.price)
        detailsField.text = item.details
        print("STORE: \(item.store?.name)")
        if let store = item.store {
            for (index, value) in stores.enumerated() {
                if value.name == store.name {
                    storePicker.selectRow(index, inComponent: 0, animated: false)
                    break
                }
            }
        }
        
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if let title = titleField.text, title != "", let details = detailsField.text, details != "", let price = priceField.text, price != "" {
            if let item = itemToEdit {
                item.title = title
                item.details = details
                item.price = (price as NSString).doubleValue
                item.store = stores[storePicker.selectedRow(inComponent: 0)]
            } else {
                let item = Item(context: managedObjectContext)
                item.title = title
                item.details = details
                item.price = (price as NSString).doubleValue
                item.store = stores[storePicker.selectedRow(inComponent: 0)]
            }
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
            let _ = navigationController?.popViewController(animated: true)
        } else {
            print("You need to enter all info to save a new item")
        }
    }
    
    @IBAction func pictureSelected(_ sender: Any) {
        
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
