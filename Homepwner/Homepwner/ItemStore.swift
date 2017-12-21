//
//  ItemStore.swift
//  Homepwner
//
//  Created by leoli on 2017/12/19.
//  Copyright © 2017年 leeo. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
        
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        
        allItems.insert(movedItem, at: toIndex)
    }
    
}


