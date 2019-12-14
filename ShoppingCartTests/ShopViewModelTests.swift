//
//  ShopViewModelTests.swift
//  ShoppingCartTests
//
//  Created by Simeon Irudhaya Raj J on 13/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import XCTest
@testable import ShoppingCart

class ShopViewModelTests: XCTestCase {
    var cart: CartService!
    var shopViewModel: ShopViewModel!
    
    override func setUp() {
        super.setUp()
        
        cart = MockCart()
        shopViewModel = ShopViewModel(
            shop: MockShop(),
            cart: cart
        )
    }
    
    func testViewDidLoad(){
        shopViewModel.viewDidLoad()
        
        let state = shopViewModel.getState()
        XCTAssert(state.cartButtonState == false)
        XCTAssertTrue(state.cartButtonState == false)
        XCTAssertTrue(state.cartButtonLabelText == "Cart")
        XCTAssertTrue(state.totalCostlabelText == "0")
        XCTAssertTrue(state.totalQuantityLabelText == "0")
    }
    
    func testAddingItemToCart() {
        cart.addItem(id: 0)
        
        let state = shopViewModel.getState()
        XCTAssert(state.cartButtonState == false)
        XCTAssertTrue(state.cartButtonState == false)
        XCTAssertTrue(state.cartButtonLabelText == "Cart")
        XCTAssertTrue(state.totalCostlabelText == "0")
        XCTAssertTrue(state.totalQuantityLabelText == "0")
    }
}
