//
//  R_MemoItem.swift
//  Reminda
//
//  Created by Dung-pc on 31/10/2024.
//

import Foundation
import RealmSwift

class RMemoItem: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String?
    @Persisted var content: String?
    @Persisted var category: Int?
    @Persisted var dateAdded: Date
    @Persisted var dateUpdate: Date
}

extension RMemoItem {
    func toMemoItem() -> MemoItem {
        return MemoItem(id: self.id, 
                        title: self.title,
                        content: self.content,
                        category: self.category,
                        dateAdded: self.dateAdded,
                        dateUpdate: self.dateUpdate)
    }
    
    func fromMemoItem(memoItem: MemoItem) {
        self.id = memoItem.id
        self.title = memoItem.title
        self.content = memoItem.content
        self.category = memoItem.category
        self.dateAdded = memoItem.dateAdded
        self.dateUpdate = memoItem.dateUpdate
    }
}
