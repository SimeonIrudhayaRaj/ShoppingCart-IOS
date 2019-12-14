//
//  MockShop.swift
//  ShoppingCartTests
//
//  Created by Simeon Irudhaya Raj J on 13/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

@testable import ShoppingCart

class MockShop: ShopService {
    private var products: [Product] = []
    
    init() {
        products = [
            Product(id: 1, name: "A", price : 10),
            Product(id: 2, name: "B", price : 20),
            Product(id: 3, name: "C", price : 30),
            Product(id: 4, name: "D", price : 40),
            Product(id: 5, name: "E", price : 50),
            Product(id: 6, name: "F", price : 60),
            Product(id: 7, name: "F", price : 70),
            Product(id: 8, name: "F", price : 80),
            Product(id: 9, name: "F", price : 90),
            Product(id: 10, name: "G", price : 100),
            Product(id: 11, name: "H", price : 110),
            Product(id: 12, name: "I", price : 120),
            Product(id: 13, name: "J", price : 130),
            Product(id: 14, name: "K", price : 140),
            Product(id: 15, name: "L", price : 150)
        ]
    }
    
    func getProducts() -> [Product] {
        return products
    }
    
    func getProduct(id: Int) -> Product? {
        for product in products where product.id == id {
            return product
        }
        return nil
    }
}
