//
//  CartViewController.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 12/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import UIKit


class CartViewController: UIViewController , UITableViewDataSource{
    // MARK: - Dependencies
    let viewModel = CartViewModel()
    
    // MARK - IBOutlet
    @IBOutlet weak var tableview: UITableView!
    
    //MARK - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource=self
    }
    
}

//MARK - TableVIewDataSource
extension CartViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell

        let cellData = viewModel.getCellData(id: indexPath.row)
        cell.productName.text = cellData.name
        cell.productQuantity.text = "\(cellData.quantity)"
        cell.id.text = "\(cellData.id)"
        cell.price.text = "\(cellData.price)"
        
        return cell
    }
}
