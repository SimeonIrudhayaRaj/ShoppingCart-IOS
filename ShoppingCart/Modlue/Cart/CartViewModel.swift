//
//  CartViewModel.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 12/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//
protocol CartViewObserver : class{
    func stateChanged(state : CartViewState) 
}
class CartViewModel :CartObserver{
    
    private let shop: ShopService
    private let cart: CartService
    
    weak var delegate : CartViewObserver?
    
    init(shop: ShopService, cart: CartService) {
        self.shop = shop
        self.cart = cart
        
        cart.setObserver(self)
    }
    
    func viewDidLoad() {
        let currentState = CartViewState(tableViewItems: cart.getCartItems() ,
                                         totalCostLabelText:"Rs.\(cart.getTotalCost())",
                                         totalQuantityLabelText: "\(cart.getTotalQuantity())" )
        state = currentState
    }
    
    var state = CartViewState( tableViewItems : []  ,
                               totalCostLabelText:"0",
                               totalQuantityLabelText: "0") {
        didSet {
            delegate?.stateChanged(state: state)
        }
    }
    func getNumberOfRows() -> Int {
        return cart.getNumberOfItems()
    }
    
    func getCellData(id:Int) -> CartItem {
        guard let cartItem = cart.getCartItem(id: id) else {
            assertionFailure()
            return CartItem( id:-1, name:"NILL", price:-1 ,quantity:-1
            )
        }
        return cartItem
    }
    
    func getState() -> CartViewState {
        return state
    }
}
//MARK: - CartObserver
extension CartViewModel{
    func itemsChanged(to cartItems: [CartItem]) {
        let currentState = CartViewState(tableViewItems: cartItems,
                                         totalCostLabelText: "Rs.\(cart.getTotalCost())",
                                         totalQuantityLabelText: "\(cart.getTotalQuantity())")
        self.state = currentState
    }
}
