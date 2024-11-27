//
//  RCollectionView+Additional.swift
//  Reminda
//
//  Created by Dung-pc on 20/11/2024.
//

import Foundation

class RCollectionViewModel: ObservableObject {
    
    @Published var items: [String] = []
    
    private let max: Int = 100
    private let countPerPage: Int = 20
    
    
    
    init() {
        
        items = (0..<countPerPage).map({ "Item : \($0+1)" })
    }
    
}

extension RCollectionViewModel {
    
    var canLoadMore: Bool {
        return items.count < max
    }
    
    func loadMore() {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
//            self?.appendItems()
//        }
        
    }
    
}

private extension RCollectionViewModel {
    
    func appendItems() {
        let array: [String] = (items.count..<items.count+countPerPage).map({ "Item : \($0+1)" })
        items.append(contentsOf: array)
    }
    
}
