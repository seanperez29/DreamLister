//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Sean Perez on 3/12/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let topItem = navigationController?.navigationBar.topItem
        topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }


}
