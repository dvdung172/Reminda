//
//  Home+ViewModel.swift
//  Reminda
//
//  Created by Dung-pc on 24/10/2024.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    // MARK: Output
    @Published var categories : [Category]
    
//    private var disposables = Set<AnyCancellable>()
    private var categoryRepository: CategoryUsecase = RCategoryRepository.shared

    init(){
        categoryRepository
        }
}
