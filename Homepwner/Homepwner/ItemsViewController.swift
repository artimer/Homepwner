//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by leoli on 2017/12/19.
//  Copyright © 2017年 leeo. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    // MARK: - 1 Property
    
    var itemStore: ItemStore!
    
    // MARK: - 2 Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    // MARK: - 3 Delegate
    
    // MARK: -- 3.1 UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    // MARK: - 4 Event Response
    
    @IBAction func addNewItem(_ sender: AnyObject) {
        
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = NSIndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
        
    }
    
    
    
    @IBAction func toggleEditingMode(_ sender: AnyObject) {
        if self.isEditing {
            sender.setTitle("Edit", for: .normal)
            
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            
            setEditing(true, animated: true)
        }
    }
    
    
    
}
