//
//  TabItem.swift
//  Reminda
//
//  Created by Dung-pc on 07/10/2024.
//

import Foundation

struct Category: Decodable, Hashable {
    var id = UUID().uuidString
    var title: String
    var icon: String?
    var index: Int?
}
