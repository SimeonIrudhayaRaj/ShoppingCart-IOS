//
//  CustomTableViewCell.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit

protocol CustomTableCellDelegate {
    func refreshScreen()
}

class CustomTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!

    // MARK: - Properties
    var viewModel = CustomTableCellViewModel()
    var delegate: CustomTableCellDelegate?
}

// MARK: - IBActions
private extension CustomTableViewCell {
    @IBAction func plus(_ sender: Any) {
        guard let id = Int(self.id.text!) else { return }
        viewModel.addButtonPressed(id: id)
        delegate?.refreshScreen()
    }
    
    @IBAction func minus(_ sender: Any) {
        guard let id = Int(self.id.text!) else { return }
        viewModel.removeButtomPressed(id:id)
        delegate?.refreshScreen()
    }
}
