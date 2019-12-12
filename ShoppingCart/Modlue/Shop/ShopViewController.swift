//
//  ShopViewController.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDataSource, CustomTableCellDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationCartButton: UIBarButtonItem!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var totalQuantity: UILabel!
    // MARK: - Dependencies
    var viewModel = ShopViewModel()
}

// MARK: - View Life Cycle
extension ShopViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationCartButton.isEnabled = false
        tableView.dataSource = self
    }
}

// MARK: -  UITableViewDataSource
extension ShopViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsForTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.delegate = self
        let product = viewModel.getCellData(for: indexPath.row)
        cell.id.text = "\(product.id)"
        cell.name.text = product.name
        cell.price.text = "\(product.price)"
        cell.quantity.text =  "\(viewModel.getCellQuantity(for: product.id))"
        return cell
    }
}

// MARK: - CustomTableCellDelegate
extension ShopViewController {
    func refreshScreen() {
        tableView.reloadData()
        updateNavigationCartButton()
        updateCost()
        updateTotalQuantity()
        
    }
}

// MARK: - UpdatingScreen
extension ShopViewController{
    func updateNavigationCartButton() {
        let buttonText = "Cart :" + viewModel.getNavigationCartButtonValue()
        navigationCartButton.title = buttonText
        if viewModel.isCartButtonEnabled() == 1 {
            navigationCartButton.isEnabled = true
        }
        else{
            navigationCartButton.isEnabled = false
        }
    }
    
    func updateTotalQuantity() {
        let labelText = viewModel.getTotalQuantityLabel()
        totalQuantity.text = labelText
    }
    
    func updateCost(){
        let labelText = viewModel.getTotalCostLabelValue()
        totalCost.text = labelText
    }
}
