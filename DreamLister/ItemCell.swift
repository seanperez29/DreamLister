//
//  ItemCell.swift
//  DreamLister
//
//  Created by Sean Perez on 3/12/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func configureCell(_ item: Item) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let number = numberFormatter.string(from: NSNumber(value: item.price))!
        titleLabel.text = item.title
        priceLabel.text = "$\(number)"
        detailLabel.text = item.details
        thumbImage.image = item.image?.image as? UIImage
    }
    
}
