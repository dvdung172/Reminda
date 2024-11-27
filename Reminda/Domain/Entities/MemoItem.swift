//
//  MemoItem.swift
//  Reminda
//
//  Created by Dung-pc on 31/10/2024.
//

import Foundation

struct MemoItem: Decodable, Hashable {
    var id: String
    var title: String?
    var content: String?
//    var language: Int?
//    var translations: Int?
    var category: Int?
    var dateAdded: Date
    var dateUpdate: Date
}
extension MemoItem {
    init() {
        self.id = UUID().uuidString
        self.title = ""
        self.content = ""
        self.category = nil
        self.dateAdded = Date()
        self.dateUpdate = Date()
    }
}
