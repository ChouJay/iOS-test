//
//  CoreDataService.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation

protocol CoreDataService {
    func store(_ table: CoreDataTable)
    func fetchAll<T: CoreDataTable>(_ table: T.Type, completion: @escaping ([T]) -> Void)
}
