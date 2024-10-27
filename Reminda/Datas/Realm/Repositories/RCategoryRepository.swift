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
    
    func insertCategory(category: Category) {
        do {
            let r_category = RCategory()
            r_category.fromCategory(category: category)
            
            try realm.write {
                realm.add(r_category)
            }
        } catch {
            print("An error occurred while saving the category: \(error)")
        }
    }
    
    func getCategory(id: String) -> Category? {
        
        let categories = realm.objects(RCategory.self)
        // Get specific category by id
        if let category = categories.first(where: { $0.id == id }) {
            return category.toCategory()
        }
        return nil
    }
    
    func getCategory() -> [Category] {
        let categories = realm.objects(RCategory.self)
        
        return categories.map {$0.toCategory()}
    }
    
    func updateCategory(id: String, title: String, icon: String?, index: Int? ) {
        do {
            let category = realm.objects(RCategory.self).first(where: { $0.id == id})
            
            try realm.write {
                category?.title = title
                category?.icon = icon
                category?.index = index
            }
        } catch {
            print("An error occurred while saving the category: \(error)")
        }
    }
    
    func deleteCategory(id: String) {
        do {
            let categories = realm.objects(RCategory.self)
            // Get specific category by id
            if let category = categories.first(where: { $0.id == id }) {
                try realm.write {
                    realm.delete(category)
                }
            }
        } catch {
            print("An error occurred while deleting the category: \(error)")
        }
    }
    
    func deleteAllCategory() {
        do {
            let categories = realm.objects(RCategory.self)
            try realm.write {
                realm.delete(categories)
            }
        } catch {
            print("An error occurred while deleting all category: \(error)")
        }
    }
}
