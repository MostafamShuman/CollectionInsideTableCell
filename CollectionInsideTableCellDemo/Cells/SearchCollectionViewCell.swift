//
//  SearchCollectionViewCell.swift
//  CollectionInsideTableCellDemo
//
//  Created by Mostafa Mohamed on 10/26/18.
//  Copyright © 2018 Mostafa Mohamed. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rating: UIImageView!
    
    func setup(with shop: Shop) {
        self.title.text = shop.name
    }
    
    func setup(with category: Category) {
        self.title.text = category.name
    }
    
    func setup(with item: Item) {
        self.title.text = item.name
    }
}
