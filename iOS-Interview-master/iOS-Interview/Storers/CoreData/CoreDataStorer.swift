//
//  CoreDataStorer.swift
//  iOS-Interview
//
//  Created by Harry Li on 2022/6/30.
//

import Foundation


final class CoreDataStorer {
    
    private let coreDateService: CoreDataService
    
    init(coreDateService: CoreDataService) {
        self.coreDateService = coreDateService
    }
}

extension CoreDataStorer {
    enum CoreDataStorerError: Error {
        case notFound
    }
}

extension CoreDataStorer {
    // TODO:
    // Step 1. Convert User to UserTable
    // Step 2. Save UserTable to CoreDataService (with .store(UserTable))
    func save(data: Data) {
//        let userTable = UserTable(id: user.id, field_name: user.name, field_email: user.email, field_is_designer: user.isDesigner, created_at: Date())
//        coreDateService.store(userTable)
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            let userTable = UserTable(id: user.id, field_name: user.name, field_email: user.email, field_is_designer: user.isDesigner, created_at: Date())
            coreDateService.store(userTable)
        } catch {
            print(error)
        }
        
        do {
            let product = try JSONDecoder().decode(Product.self, from: data)
            let productTable = ProductTable(
                id: product.id,
                field_title: product.title,
                field_description: product.description,
                field_price: product.price,
                created_at: Date(),
                user: UserTable(id: product.user.id,
                                field_name: product.user.name,
                                field_email: product.user.email,
                                field_is_designer: product.user.isDesigner,
                                created_at: Date()))
            coreDateService.store(productTable)
        } catch {
            print(error)
        }
        
    }
    
    // TODO:
    // Step 1. Fetch user with specifically User.id
    // Step 1-1. if User.id is not exists in coreDateService than completion with notFound Failure
    // Step 1-2. if User.id is exists in coreDateService than convert it to User and completion with User Success
    func fetch(user: User, completion: @escaping (Result<User, CoreDataStorerError>) -> Void) {
        coreDateService.fetchAll(UserTable.self) { userTables in
            for userTable in userTables {
                if userTable.id == user.id {
                    let user = User(id: userTable.id, name: userTable.field_name, email: userTable.field_email, isDesigner: userTable.field_is_designer)
                    completion(.success(user))
                }
            }
            completion(.failure(.notFound))
        }
    }
}

