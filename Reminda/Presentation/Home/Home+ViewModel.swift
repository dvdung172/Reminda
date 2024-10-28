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
    @Published private(set) var categories : [Category]
    
    private let disposeBag = DisposeBag()
    private var categoryRepository: CategoryUsecase = RCategoryRepository.shared
    
    init(categories: [Category]) {
        self.categories = []
    }
    
    func getListCategories() {
        categoryRepository
            .getListCategories()
            .asObservable()
            .subscribe { [weak self] categories in
                self?.categories = categories
            } onError: { [weak self] error in
                print("\(error)")
            }
            .disposed(by: disposeBag)
    }
}
