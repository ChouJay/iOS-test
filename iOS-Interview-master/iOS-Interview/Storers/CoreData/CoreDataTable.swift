//
//  CoreDataTable.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

protocol CoreDataTable: Codable {
    func toData() -> Data
}

extension CoreDataTable {
    func toData() -> Data {
        return try! JSONEncoder().encode(self)
    }
}
