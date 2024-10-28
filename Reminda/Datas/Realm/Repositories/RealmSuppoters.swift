//
//  RealmSuppoters.swift
//  Reminda
//
//  Created by Dung-pc on 24/10/2024.
//

import Foundation
import RealmSwift


struct RealmError: Error {
    let msg: String
}

struct RealmPersistent {
    static func initializer() -> Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch let err {
            fatalError("Failed to open Realm error: \(err.localizedDescription)")
        }
    }
}
