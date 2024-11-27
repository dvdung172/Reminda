//
//  TabItem.swift
//  Reminda
//
//  Created by Dung-pc on 07/10/2024.
//

import Foundation

struct Category: Decodable, Hashable {
    var id: String
    var title: String
    var icon: String?
    var index: Int?
    var dateAdded: Date
    var dateUpdate: Date
}
extension Category {
    init() {
        self.id = UUID().uuidString
        self.title = ""
        self.icon = nil
        self.index = nil
        self.dateAdded = Date()
        self.dateUpdate = Date()
    }
}
