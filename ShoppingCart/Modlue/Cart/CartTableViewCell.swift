//
//  CartTableViewCell.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 12/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productQuantity: UILabel!

    @IBAction func minus(_ sender: Any) {
        guard let id:Int = Int(self.id.text!) else { return}
        viewModel.minusButtonPressed(id:id)
    }
    
    @IBAction func plus(_ sender: Any) {
        guard let id:Int = Int(self.id.text!) else { return}
        viewModel.plusButtonPressed(id:id)
    }
    
    
    let viewModel = CartTableViewCellModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
