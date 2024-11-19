//
//  ComposeMemo+ViewModel.swift
//  Reminda
//
//  Created by Dung-pc on 13/11/2024.
//

import Foundation
import RxSwift

class ComposeMemoViewModel: ObservableObject {
    
    // MARK: Output
    private let disposeBag = DisposeBag()
    private var memoItemRepository: MemoItemUsecase = RMemoItemRepository.shared
    
    func add(title: String?, content: String?, category: Int?) {
        memoItemRepository
            .insertMemoItem(memoItem: MemoItem(id: UUID().uuidString, title: title, content: content, category: category))
            .asObservable()
            .subscribe { _ in
                
            } onError: { error in
                print("\(error)")
            }
            .disposed(by: disposeBag)
    }
}