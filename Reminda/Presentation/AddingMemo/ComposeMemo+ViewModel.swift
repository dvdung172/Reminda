//
//  ComposeMemo+ViewModel.swift
//  Reminda
//
//  Created by Dung-pc on 13/11/2024.
//

import Foundation
import RxSwift

class ComposeMemoViewModel: ObservableObject {
    
    @Published private(set) var memoItem : MemoItem = MemoItem()
    
    // MARK: Output
    private let disposeBag = DisposeBag()
    private var memoItemRepository: MemoItemUsecase = RMemoItemRepository.shared
    
    init() {
    }
}

extension ComposeMemoViewModel {
    func setUpVM(memoItem: MemoItem) {
        self.memoItem = memoItem
    }
}

extension ComposeMemoViewModel {
    func add() {
        memoItemRepository
            .insertMemoItem(memoItem: self.memoItem)
            .asObservable()
            .subscribe { _ in
                
            } onError: { error in
                print("\(error)")
            }
            .disposed(by: disposeBag)
    }
}

extension ComposeMemoViewModel {
    func update() {
        memoItemRepository
            .updateMemoItem(memoItem: self.memoItem)
            .subscribe { [weak self] in
//                self?.categories[0] = category
            } onError: { error in
                print("\(error)")
            }
            .disposed(by: disposeBag)
    }
}
