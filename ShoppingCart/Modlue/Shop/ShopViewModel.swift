//
//  ShopViewModel.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

protocol ShopViewModelDelegate: class {
    func stateChanged(to state: ShopViewState)
}

class ShopViewModel: CartObserver {
    private let shop = Shop.shared
    private let cart = Cart.shared
    
    weak var delegate: ShopViewModelDelegate?
    
    init() {
        cart.observer = self
    }
    
    private var state = ShopViewState(
        cartButtonLabelText: "Cart",
        tableViewItems: [],
        totalCostlabelText: "Rs 0",
        totalQuantityLabelText: "0",
        cartButtonState : false
        
    ) {
        didSet {
            delegate?.stateChanged(to: state)
        }
    }
    
    func viewDidLoad(){
        let cartItems = shop
            .getProducts()
            .map {
                CartItem(
                    id: $0.id,
                    name: $0.name,
                    price: $0.price,
                    quantity: 0
                )
        }
        state = ShopViewState(
            cartButtonLabelText: "Cart",
            tableViewItems: cartItems,
            totalCostlabelText: "0",
            totalQuantityLabelText: "0",
            cartButtonState: false
        )
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

// MARK: - CartObserver
extension ShopViewModel {
    func itemsChanged(to cartItems: [CartItem]) {
        let totalQuantity = cart.getTotalQuantity()
        let totalCost = cart.getTotalCost()
        var tableViewItems:[CartItem] = []
        var cartButtonState:Bool = false
        
        
//                for product in shop.getProducts() {
//                    for cartItem in cartItems where product.id == cartItem.id {
//                        tableViewItems.append(cartItem)
//
//                    } else {
//                        let nonCartItem = CartItem(id: product.id,
//                                                   name: product.name,
//                                                   price: product.price,
//                                                   quantity: 0)
//                        tableViewItems.append(nonCartItem)
//                    }
//                  }
//    }
        
        for product in shop.getProducts() {
            var flag=0
            for cartItem in cartItems where product.id == cartItem.id {
                tableViewItems.append(cartItem)
                flag = 1
                break
            }
            if flag == 0{
                let nonCartItem = CartItem(id: product.id,
                                           name: product.name,
                                           price: product.price,
                                           quantity: 0)
                tableViewItems.append(nonCartItem)
                
            }
        
            if totalQuantity == 0 {
                cartButtonState = false
            } else {
                cartButtonState = true
            }
            state = ShopViewState(
                cartButtonLabelText: "Cart \(totalQuantity)",
                tableViewItems: tableViewItems,
                totalCostlabelText: "Rs \(totalCost)",
                totalQuantityLabelText: "\(totalQuantity)",
                cartButtonState: cartButtonState
            )
        }
    }
}
