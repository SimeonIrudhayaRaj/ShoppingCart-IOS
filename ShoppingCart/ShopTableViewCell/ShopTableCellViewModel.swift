//
//  CustomTableCellViewModel.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//
protocol CellButtonObserver:class {
    func cellButtonPressed(state: ShopTableViewCellState)
}
class ShopTableCellViewModel {
    private let shop = Shop.shared
    private let cart = Cart.shared
    weak var delegate: CellButtonObserver?
    private var state = ShopTableViewCellState(isRemoveButtonEnabled: false){
        didSet {
            delegate?.cellButtonPressed(state: state)
        }
    }
    
    func addButtonPressed(id:Int) {
        cart.addItem(id:id)
        checkMinusButtonState(id:id)
    }
    
    func removeButtomPressed(id:Int){
        cart.removeItem(id:id)
        checkMinusButtonState(id:id)
        
    }
    
    
    func checkMinusButtonState(id: Int){
        let cartItems = cart.getCartItems()
        
        for cartItem in cartItems where cartItem.id == id {
            state =  ShopTableViewCellState(isRemoveButtonEnabled: true)
            return
        }
        state =  ShopTableViewCellState(isRemoveButtonEnabled: false)
        
    }
}
