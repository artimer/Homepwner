//
//  DetailViewController.swift
//  Homepwner
//
//  Created by leoli on 2017/12/21.
//  Copyright © 2017年 leeo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: Item!
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumbeField: UITextField!
    @IBOutlet var valueField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumbeField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: item.valueInDollars as NSNumber)
        dateLabel.text = dateFormatter.string(from: item.dateCreated as Date)
    }
    
}