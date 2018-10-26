//
//  SearchTableViewCell.swift
//  CollectionInsideTableCellDemo
//
//  Created by Mostafa Mohamed on 10/26/18.
//  Copyright © 2018 Mostafa Mohamed. All rights reserved.
//

import UIKit

protocol CustomCellDelegate {
    func didItemSelected(cellType: CellType, item: Any)
}
class SearchTableViewCell: UITableViewCell {

    // Cell Type
    var cellType: CellType!
    // Models
    var shops: [Shop] = []
    var categories: [Category] = []
    var items: [Item] = []
    // Outelets
    @IBOutlet weak var collectionView: UICollectionView!
    // Custom Delegate
    var deleagte: CustomCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    // Update Data
    func update(with shops: [Shop]) {
        self.shops = shops
        self.collectionView.reloadData()
    }
    
    func update(with categories: [Category]) {
        self.categories = categories
        self.collectionView.reloadData()
    }
    
    func update(with items: [Item]) {
        self.items = items
        self.collectionView.reloadData()
    }
}

extension SearchTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch cellType {
        case .shop:
            return shops.count
        case .category:
            return categories.count
        case .item:
            return items.count
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        switch cellType {
        case .shop:
            cell.setup(with: shops[indexPath.row])
        case .category:
            cell.setup(with: categories[indexPath.row])
        case .item:
            cell.setup(with: items[indexPath.row])
        default:
            break
        }
        return cell
    }
}

extension SearchTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if deleagte != nil {
            switch cellType  {
            case .shop:
                deleagte.didItemSelected(cellType: cellType, item: shops[indexPath.row])
            case .category:
                deleagte.didItemSelected(cellType: cellType, item: categories[indexPath.row])
            case .item:
                deleagte.didItemSelected(cellType: cellType, item: items[indexPath.row])
            default:
                break
            }
        }
        
    }
}

