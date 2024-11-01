//
//  Home+ViewModel.swift
//  Reminda
//
//  Created by Dung-pc on 24/10/2024.
//

import Foundation
import RxSwift

class HomeViewModel: ObservableObject {
    
    // MARK: Output
    @Published private(set) var categories : [Category] = []
    
    private let disposeBag = DisposeBag()
    private var categoryRepository: CategoryUsecase = RCategoryRepository.shared
    
    func getListCategories() {
        categoryRepository
            .getListCategories()
            .asObservable()
            .subscribe { [weak self] categories in
                self?.categories = categories
            } onError: { error in
                print("\(error)")
            }
            .disposed(by: disposeBag)
    }
    func add() {
        categoryRepository
            .insertCategory(category: Category(id: UUID().uuidString, title: "memory") )
            .asObservable()
            .subscribe { [weak self] categories in
//                self?.getListCategories()
            } onError: { error in
                print("\(error)")
            }
            .disposed(by: disposeBag)
    }
}
