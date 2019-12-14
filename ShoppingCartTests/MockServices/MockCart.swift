//
//  MockCart.swift
//  ShoppingCartTests
//
//  Created by Simeon Irudhaya Raj J on 13/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

@testable import ShoppingCart

class MockCart: CartService {
    func setObserver(_ observer: CartObserver?) {
        <#code#>
    }
    
    func addItem(id: Int) {
        <#code#>
    }
    
    func removeItem(id: Int) {
        <#code#>
    }
    
    func getQuantityOfItem(id: Int) -> Int {
        <#code#>
    }
    
    func getTotalQuantity() -> Int {
        <#code#>
    }
    
    func getNumberOfItems() -> Int {
        <#code#>
    }
    
    func getCartItem(id: Int) -> CartItem? {
        <#code#>
    }
    
    func getCartItems() -> [CartItem] {
        <#code#>
    }
    
    func getTotalCost() -> Int {
        
    }
}
