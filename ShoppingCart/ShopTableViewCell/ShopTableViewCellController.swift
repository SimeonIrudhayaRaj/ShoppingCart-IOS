//
//  CustomTableViewCell.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit

class ShopTableViewCellController: UITableViewCell, CellButtonObserver {
   
    // MARK: - IBOutlets
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    
    // MARK: - State
    private var state = ShopTableViewCellState(isRemoveButtonEnabled: false){
        didSet {
            reloadView()
        }
    }
    // MARK: - Properties
    var viewModel = ShopTableCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minusButton.isEnabled = state.isRemoveButtonEnabled
        viewModel.delegate = self
        reloadView()
    }
}

// MARK: - IBActions
private extension ShopTableViewCellController {
    @IBAction func plus(_ sender: Any) {
        guard let id = Int(self.id.text!) else { return }
        viewModel.addButtonPressed(id: id)
    }
    
    @IBAction func minus(_ sender: Any) {
        guard let id = Int(self.id.text!) else { return }
        viewModel.removeButtomPressed(id:id)
    }
}


// MARK: - ReloadView
extension ShopTableViewCellController {
    func reloadView()
    {
        minusButton.isEnabled = state.isRemoveButtonEnabled
        
    }
}

//MARK: - CellButtonObserver
extension ShopTableViewCellController {
    func cellButtonPressed(state: ShopTableViewCellState) {
        let newState = ShopTableViewCellState(isRemoveButtonEnabled: state.isRemoveButtonEnabled)
        self.state = newState
    }
}
