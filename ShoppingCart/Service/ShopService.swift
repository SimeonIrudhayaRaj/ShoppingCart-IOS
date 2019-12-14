//
//  ShopService.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 13/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

protocol ShopService {
    func getProducts() -> [Product]
    func getProduct(id: Int) -> Product?
}
