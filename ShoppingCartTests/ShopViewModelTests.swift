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
    var shop: ShopService!
    var shopViewModel: ShopViewModel!
    
    override func setUp() {
        super.setUp()
        shop = MockShop()
        cart = MockCart()
        shopViewModel = ShopViewModel(
            shop: shop,
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
    
    func testAddingOneItemToCart() {
        cart.addItem(id: 1)
        
        let state = shopViewModel.getState()
        XCTAssert(state.cartButtonState == true)
        XCTAssert(state.cartButtonLabelText == "Cart 1")
        XCTAssert(state.totalCostlabelText == "Rs 10")
        XCTAssert(state.totalQuantityLabelText == "1")
    }
    
    func testAddingMultipleItemsToCart() {
        cart.addItem(id: 1)
        cart.addItem(id: 1)
        cart.addItem(id: 2)
        let state = shopViewModel.getState()
        XCTAssert(state.cartButtonState == true)
        XCTAssert(state.cartButtonLabelText == "Cart 3")
        XCTAssert(state.totalCostlabelText == "Rs 40")
        XCTAssert(state.totalQuantityLabelText == "3")
    }
    
    func testRemovingOneItemFromCart(){
        cart.addItem(id: 1)
        cart.addItem(id: 1)
        
        cart.removeItem(id: 1)
        let state = shopViewModel.getState()
        XCTAssert(state.cartButtonState == true)
        XCTAssert(state.cartButtonLabelText == "Cart 1")
        XCTAssert(state.totalCostlabelText == "Rs 10")
        XCTAssert(state.totalQuantityLabelText == "1")
    }
    
    func testRemovingMultipleItemsFromCart() {
        cart.addItem(id: 1)
        cart.addItem(id: 1)
        cart.addItem(id: 2)
        cart.addItem(id: 2)

        cart.removeItem(id: 1)
        cart.removeItem(id: 2)
        let state = shopViewModel.getState()
        XCTAssert(state.cartButtonState == true)
        XCTAssert(state.cartButtonLabelText == "Cart 2")
        XCTAssert(state.totalCostlabelText == "Rs 30")
        XCTAssert(state.totalQuantityLabelText == "2")
    }
    
    func testEmptyingCart() {
        cart.addItem(id: 1)
        cart.removeItem(id: 1)
        let state = shopViewModel.getState()
        XCTAssert(state.cartButtonState == false)
        XCTAssert(state.cartButtonLabelText == "Cart 0")
        XCTAssert(state.totalCostlabelText == "Rs 0")
        XCTAssert(state.totalQuantityLabelText == "0")
    }
    
}
