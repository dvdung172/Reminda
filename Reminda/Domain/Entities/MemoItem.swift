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
}
