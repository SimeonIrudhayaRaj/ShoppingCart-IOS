//
//  CartItem.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 12/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

struct CartItem {
    let id: Int
    let name: String
    var price: Int
    var quantity: Int
    
    init(id:Int ,name: String ,price:Int ,quantity: Int) {
        self.name = name
        self.quantity = quantity
        self.id = id
        self.price = price
    }
}
