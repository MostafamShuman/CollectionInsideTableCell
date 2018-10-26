//
//  Models.swift
//  CollectionInsideTableCellDemo
//
//  Created by Mostafa Mohamed on 10/26/18.
//  Copyright © 2018 Mostafa Mohamed. All rights reserved.
//

import Foundation

struct Shop {
    var name: String
    var id: Int
}

struct Category {
    var name: String
    var id: Int
}

struct Item {
    var name: String
    var id: Int
}


class ModelManager {
    static func getShops() -> [Shop] {
        let user1 = Shop(name: "AAA", id: 1)
        let user2 = Shop(name: "BBB", id: 1)
        let user3 = Shop(name: "CCC", id: 1)
        let user4 = Shop(name: "DDD", id: 1)
        let user5 = Shop(name: "EEE", id: 1)
        let user6 = Shop(name: "FFF", id: 1)
        let user7 = Shop(name: "GGG", id: 1)
        let user8 = Shop(name: "HHH", id: 1)
        return [user1, user2, user3, user4, user5, user6, user7, user8]
    }
    
    static func getCategories() -> [Category] {
        let contact1 = Category(name: "aaa", id: 1)
        let contact2 = Category(name: "bbb", id: 1)
        let contact3 = Category(name: "ccc", id: 1)
        let contact4 = Category(name: "ddd", id: 1)
        let contact5 = Category(name: "eee", id: 1)
        let contact6 = Category(name: "fff", id: 1)
        let contact7 = Category(name: "ggg", id: 1)
        let contact8 = Category(name: "hhh", id: 1)
        return [contact1, contact2, contact3, contact4, contact5, contact6, contact7, contact8]
    }
    
    static func getItems() -> [Item] {
        let item1 = Item(name: "111", id: 1)
        let item2 = Item(name: "222", id: 1)
        let item3 = Item(name: "333", id: 1)
        let item4 = Item(name: "444", id: 1)
        let item5 = Item(name: "555", id: 1)
        let item6 = Item(name: "666", id: 1)
        let item7 = Item(name: "777", id: 1)
        let item8 = Item(name: "888", id: 1)
        return [item1, item2, item3, item4, item5, item6, item7, item8]
    }
    
}
