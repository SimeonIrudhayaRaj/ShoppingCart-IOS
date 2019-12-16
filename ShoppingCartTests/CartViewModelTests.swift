//
//  CartViewModelTests.swift
//  ShoppingCartTests
//
//  Created by Simeon Irudhaya Raj J on 16/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

import XCTest
@testable import ShoppingCart

class CartViewModelTests: XCTestCase {
    var cart: CartService!
    var shop: ShopService!
    var cartViewModel: CartViewModel!
    
    override func setUp() {
        super.setUp()
        cart = MockCart()
        shop = MockShop()
        cartViewModel = CartViewModel(shop: shop,
                                      cart: cart)
        cart.addItem(id: 1)

    }
    
    
    
    func testViewDidLoad(){
        cartViewModel.viewDidLoad()
        let state = cartViewModel.getState()
        XCTAssertTrue(state.totalCostLabelText == "Rs.10")
        XCTAssertTrue(state.totalQuantityLabelText == "1")
    }

    func testCartWithMultipleItems() {
        cart.addItem(id: 1)
        cart.addItem(id: 2)
        let state = cartViewModel.getState()
        XCTAssertTrue(state.totalCostLabelText == "Rs.40")
        XCTAssertTrue(state.totalQuantityLabelText == "3")
    }


    func testRemovingOneItemFromCart(){
        cart.addItem(id: 1)
        cart.removeItem(id: 1)
        let state = cartViewModel.getState()
        XCTAssertTrue(state.totalCostLabelText == "Rs.10")
        XCTAssertTrue(state.totalQuantityLabelText == "1")
    }

    func testRemovingMultipleItemsFromCart() {
        cart.addItem(id: 1)
        cart.addItem(id: 1)
        

        cart.removeItem(id: 1)
        cart.removeItem(id: 1)
        let state = cartViewModel.getState()
        XCTAssertTrue(state.totalCostLabelText == "Rs.10")
        XCTAssertTrue(state.totalQuantityLabelText == "1")
    }

    func testEmptyingCart() {
        cart.removeItem(id: 1)
        let state = cartViewModel.getState()
        XCTAssertTrue(state.totalCostLabelText == "Rs.0")
        XCTAssertTrue(state.totalQuantityLabelText == "0")
    }
//
//
}
