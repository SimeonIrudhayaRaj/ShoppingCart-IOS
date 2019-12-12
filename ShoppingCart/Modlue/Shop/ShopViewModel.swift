//
//  ShopViewModel.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

class ShopViewModel {
    private let shop = Shop.shared
    private let cart = Cart.shared
    
    
    func getNumberOfRowsForTableView() -> Int {
        return shop.getProducts().count
    }
    
    func getCellData(for row:Int) -> Product {
        return shop.getProducts()[row]
    }
    
    func getCellQuantity(for row:Int) -> Int {
        return cart.getQuantityOfItem(id:row)
    }
    
    func getNavigationCartButtonValue() -> String {
        return "\(cart.getTotalQuantity())"
    }
    
    func getTotalQuantityLabel() -> String {
        return "\(cart.getTotalQuantity())"
    }
    
    func getTotalCostLabelValue() -> String {
        return "\(cart.getTotalCost())"
    }

    func isCartButtonEnabled() -> Int {
        if cart.getTotalQuantity() == 0{
            return 0
        } else {
            return 1
        }
    }
}
