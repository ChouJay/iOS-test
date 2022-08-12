//
//  UserTable.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

extension CoreDataStorer {
    struct UserTable: CoreDataTable {
        let id: String
        let field_name: String
        let field_email: String
        let field_is_designer: Bool
        let created_at: Date
    }
}
