//
//  Product.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

struct Product: Codable {
    let id: String
    let title: String
    let description: String
    let price: Decimal
    let user: User
}
