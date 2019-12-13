//
//  CustomTableViewCell.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!

    // MARK: - State
    private var state = CustomTableCellState(quantity: 0){
        didSet {
            
        }
    }
    // MARK: - Properties
    var viewModel = CustomTableCellViewModel()
}

// MARK: - IBActions
private extension CustomTableViewCell {
    @IBAction func plus(_ sender: Any) {
        guard let id = Int(self.id.text!) else { return }
        viewModel.addButtonPressed(id: id)
    }
    
    @IBAction func minus(_ sender: Any) {
        guard let id = Int(self.id.text!) else { return }
        viewModel.removeButtomPressed(id:id)
    }
}
