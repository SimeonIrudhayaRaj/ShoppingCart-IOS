//
//  CartViewController.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 12/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit


class CartViewController: UIViewController , UITableViewDataSource , CartViewObserver{
    // MARK: - Dependencies
    let viewModel = CartViewModel()

    
    //MARK: - State
    private var state = CartViewState(
        tableViewItems: [],
        totalCostLabelText:"0",
        totalQuantityLabelText: "Rs 0") {
        didSet {
            renderView()
            
        }
    }
    // MARK - IBOutlet
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var totalQuantity: UILabel!
    
    //MARK - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource=self
        viewModel.delegate=self
        viewModel.viewDidLoad()
    }
    
}

//MARK - TableVIewDataSource
extension CartViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.tableViewItems.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell

//        let cellData = viewModel.getCellData(id: indexPath.row)
        let cellData = state.tableViewItems[indexPath.row]
        cell.productName.text = cellData.name
        cell.productQuantity.text = "\(cellData.quantity)"
        cell.id.text = "\(cellData.id)"
        cell.price.text = "\(cellData.price)"
        
        return cell
    }
}

//MARK: - Rendering View
extension CartViewController {
    func renderView(){
        totalCost.text = state.totalCostLabelText
        totalQuantity.text = state.totalQuantityLabelText
        tableview.reloadData()
    }
}

//MARk: - CartViewObserver
extension CartViewController{
    func stateChanged(state: CartViewState) {
        self.state=state
    }
}

