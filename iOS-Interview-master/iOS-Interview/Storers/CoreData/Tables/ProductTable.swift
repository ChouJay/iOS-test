//
//  ProductTable.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

extension CoreDataStorer {
    struct ProductTable: CoreDataTable {
        let id: String
        let field_title: String
        let field_description: String
        let field_price: Decimal
        let created_at: Date
        let user: UserTable
    }
}
