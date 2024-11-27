//
//  RCategory.swift
//  Reminda
//
//  Created by Dung-pc on 14/10/2024.
//

import Foundation
import RealmSwift

class RCategory: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String?
    @Persisted var icon: String?
    @Persisted var index: Int?
    @Persisted var dateAdded: Date
    @Persisted var dateUpdate: Date
}

extension RCategory {
    func toCategory() -> Category {
        return Category(id: self.id,
                        title: self.title ?? "",
                        icon: self.icon,
                        index: self.index,
                        dateAdded: self.dateAdded,
                        dateUpdate: self.dateUpdate)
    }
    
    func fromCategory(category: Category) {
        self.id = category.id
        self.title = category.title
        self.icon = category.icon
        self.index = category.index
        self.dateAdded = category.dateAdded
        self.dateUpdate = category.dateUpdate
    }
}
