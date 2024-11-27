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
    @Published private(set) var memoItems : [MemoItem] = []
    
    private let disposeBag = DisposeBag()
    private var categoryRepository: CategoryUsecase = RCategoryRepository.shared
    private var memoItemRepository: MemoItemUsecase = RMemoItemRepository.shared
    
    init() {
        getData()
    }
}

extension HomeViewModel {
    func getData() {
        Single.zip(
            categoryRepository.getListCategories(),
            memoItemRepository.getList()
        )
        .asObservable()
        .subscribe { [weak self] categories, items in
            self?.categories = categories
            self?.memoItems = items
        } onError: { error in
            print("\(error)")
        }
        .disposed(by: disposeBag)
        
    }
}

extension HomeViewModel {
    func update(category: Category) {
        categoryRepository
            .updateCategory(category: category)
            .subscribe { [weak self] in
                self?.categories[0] = category
            } onError: { error in
                print("\(error)")
            }
            .disposed(by: disposeBag)
    }
}
