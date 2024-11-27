//
//  RCategoryRepository.swift
//  Reminda
//
//  Created by Dung-pc on 14/10/2024.
//

import Foundation
import RealmSwift
import RxSwift

struct RCategoryRepository: CategoryUsecase {
    
    static let shared: CategoryUsecase = RCategoryRepository()
    
    private let realm = RealmPersistent.initializer()
    
    func insertCategory(category: Category) -> Completable {
        return Completable.create { observer in
            let maybeError = RealmError(msg: "An error occurred while saving the category")
            
            do {
                let r_category = RCategory()
                r_category.fromCategory(category: category)
                
                try realm?.write {
                    realm?.add(r_category)
                    
                    observer(.completed)
                }
            } catch {
                observer(.error(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func getCategory(id: String) -> Single<Category> {
        return Single<Category>.create { observer in
            let maybeError = RealmError(msg: "An error occurred while fetching the category")
            
            if let category = realm?.objects(RCategory.self).first(where: { $0.id == id }) {
                observer(.success(category.toCategory()))
            } else {
                observer(.failure(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func getListCategories() -> Single<[Category]> {
        return Single<[Category]>.create { observer in
            let maybeError = RealmError(msg: "An error occurred while fetching the categories")
            
            if let categories = realm?.objects(RCategory.self) {
                let usersArray: [Category] = categories.map {$0.toCategory()}
                observer(.success(usersArray))
            } else {
                observer(.failure(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func updateCategory(category: Category) -> Completable {
        return Completable.create { observer in
            let maybeError = RealmError(msg: "An error occurred while saving the category")
            
            do {
                let r_category = RCategory()
                r_category.fromCategory(category: category)
                
                try realm?.write {
                    realm?.add(r_category, update: .modified)
                    
                    observer(.completed)
                }
            } catch {
                observer(.error(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func deleteCategory(id: String)  -> Completable {
        return Completable.create { observer in
            let maybeError = RealmError(msg: "An error occurred while deleting the category")
            
            do {
                let categories = realm?.objects(RCategory.self)
                // Get specific category by id
                if let category = categories?.first(where: { $0.id == id }) {
                    try realm?.write {
                        realm?.delete(category)
                        observer(.completed)
                    }
                }
            } catch {
                observer(.error(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func deleteAllCategory() -> Completable {
        return Completable.create { observer in
            let maybeError = RealmError(msg: "An error occurred while deleting all category")
            
            do {
                if let categories = realm?.objects(RCategory.self) {
                    try realm?.write {
                        realm?.delete(categories)
                        
                        observer(.completed)
                        return
                    }
                }
                
            } catch {
                observer(.error(maybeError))
            }
            
            return Disposables.create()
        }
    }
}
