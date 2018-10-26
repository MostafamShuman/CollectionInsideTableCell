//
//  SearchViewController.swift
//  CollectionInsideTableCellDemo
//
//  Created by Mostafa Mohamed on 10/26/18.
//  Copyright © 2018 Mostafa Mohamed. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    // Models
    var shops: [Shop] = []
    var categories: [Category] = []
    var items: [Item] = []
    
    // Sections
    var results: [String] = [
        NSLocalizedString("SearchShopsResults", comment: ""),
        NSLocalizedString("SearchCategoriesResults", comment: ""),
        NSLocalizedString("SearchItemsResults", comment: ""),
        ]
    // Presenter
//    var presenter: SearchPresenterProtocol?
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()
//        self.presenter = SearchPresenter(view: self)
//        tableView.tableFooterView = UIView()
    }

}

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        switch indexPath.section {
        case 0:
            cell.cellType = .shop
            cell.update(with: shops)
        case 1:
            cell.cellType = .category
            cell.update(with: categories)
        case 2:
            cell.cellType = .item
            cell.update(with: items)
        default:
            break
        }
        cell.deleagte = self
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let lang = UserdefaultsManager.getObject(forKey: UserdefaultsKeys.language) as? String ?? AppConstants.english
//        let secView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 35) )
//        let label: UILabel = UILabel(frame: CGRect(x: lang == AppConstants.english ? 20 : -20, y: 0, width: secView.frame.width, height: 35) )
//        label.text = results[section]
//        label.font = UIFont(name: "Cairo-Bold", size: 20)
//        secView.addSubview(label)
//        return secView
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            if shops.count > 0 {
                return 45
            }
        case 1:
            if categories.count > 0 {
                return 45
            }
        case 2:
            if items.count > 0 {
                return 45
            }
        default:
            break
        }
        return 0
    }

}

extension SearchViewController: CustomCellDelegate {
    func didItemSelected(cellType: CellType, item: Any) {
        switch cellType {
        case .shop:
            print("Shop")
        case .category:
            print("Category")
        case .item:
            print("Item")
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.shops = ModelManager.getShops()
        self.categories = ModelManager.getCategories()
        self.items = ModelManager.getItems()
        
        tableView.reloadData()
    }
}
extension SearchViewController/*: SearchViewProtocol*/ {
    func update(shop: [Shop], categories: [Category], items: [Item]) {
        self.shops = shop
        self.categories = categories
        self.items = items
        tableView.reloadData()
    }
}
