//
//  HomeTabViewUsecase.swift
//  Reminda
//
//  Created by Dung-pc on 07/10/2024.
//

import Foundation
import RxSwift

protocol CategoryUsecase {
    func insertCategory(category: Category) -> Completable
    func getCategory(id: String) -> Single<Category>
    func getListCategories() -> Single<[Category]>
    func updateCategory(category: Category) -> Completable
    func deleteCategory(id: String)  -> Completable
    func deleteAllCategory() -> Completable
}
