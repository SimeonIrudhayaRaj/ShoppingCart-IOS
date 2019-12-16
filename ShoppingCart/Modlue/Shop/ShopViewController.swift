//
//  ShopViewController.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDataSource, ShopViewModelDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationCartButton: UIBarButtonItem!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var totalQuantity: UILabel!

    // MARK: - Dependencies
    var viewModel = ShopViewModelFactory.createInstance()
    
    // MARK: - Properties
    private var state = ShopViewState(
        cartButtonLabelText: "Cart",
        tableViewItems: [],
        totalCostlabelText: "Rs 0",
        totalQuantityLabelText: "0",
        cartButtonState: false
    ) {
        didSet {
            renderCurrentState()
        }
    }
}

// MARK: - View Life Cycle
extension ShopViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

        viewModel.delegate = self
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }

}




// MARK: -  UITableViewDataSource
extension ShopViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.tableViewItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ShopTableViewCellController
        let cartItem = state.tableViewItems[indexPath.row]
        cell.id.text = "\(cartItem.id)"
        cell.name.text = cartItem.name
        cell.price.text = "\(cartItem.price)"
        cell.quantity.text = String(cartItem.quantity)
        return cell
    }
}

// MARK: - UpdatingScreen
extension ShopViewController{
    func renderCurrentState() {
        navigationCartButton.title = state.cartButtonLabelText
        totalCost.text = state.totalCostlabelText
        totalQuantity.text = state.totalQuantityLabelText
        tableView.reloadData()
        navigationCartButton.isEnabled = state.cartButtonState
        
    }
}

// MARK: - ShopViewModelDelegate
extension ShopViewController {
    func stateChanged(to state: ShopViewState) {
        self.state = state
    }
}
