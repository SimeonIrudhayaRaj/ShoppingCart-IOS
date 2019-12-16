//
//  ShopCart.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

protocol CartObserver: class {
    func itemsChanged(to cartItems: [CartItem])
}

class Cart: CartService {
    
    
    func setObserver(_ observer: CartObserver?) {
        self.observer = observer
    }
    
    static let shared = Cart()

    private let shop = Shop.shared
    
    weak var observer: CartObserver?
    
    private var cartItems: [CartItem] = [] {
        didSet {
            observer?.itemsChanged(to: cartItems)
        }
    }
    
    func addItem(id:Int) {
        for (i, cartItem) in cartItems.enumerated() where cartItem.id == id {
            cartItems[i].quantity += 1
            return
        }
        guard let product = shop.getProduct(id: id) else {
            assertionFailure()
            return
        }
        let cartItem = CartItem(
            id: id,
            name: product.name,
            price: product.price,
            quantity: 1
        )
        cartItems.append(cartItem)
    }
    
    func removeItem(id:Int){
        for (i, cartItem) in cartItems.enumerated() where cartItem.id == id {
            cartItems[i].quantity -= 1
            if cartItems[i].quantity == 0 {
                cartItems.remove(at: i)
            }
            return
        }
    }
    
    func getQuantityOfItem(id:Int) -> Int {
        for cartItem in cartItems where cartItem.id == id {
            return cartItem.quantity
        }
        return 0
        
    }
    
    func getTotalQuantity() -> Int {
        var totalQuantity :Int = 0
        for cartItem in cartItems {
            totalQuantity += cartItem.quantity
        }
        return totalQuantity
    }
    
    func getNumberOfItems() -> Int {
        return cartItems.count
    }
    
    func getCartItem(id:Int) -> CartItem? {
        
        let cartProduct = cartItems[id]
        let cartItem = CartItem(id:cartProduct.id ,name:cartProduct.name, price:cartProduct.price , quantity:cartProduct.quantity)
        return cartItem
        
    }
    func getCartItems() -> [CartItem] {
        return cartItems
    }
    
    func getTotalCost() -> Int {
        var totalCost :Int = 0
        for cartItem in cartItems {
            totalCost +=  cartItem.price * cartItem.quantity
        }
        return totalCost
    }
    
    
}


