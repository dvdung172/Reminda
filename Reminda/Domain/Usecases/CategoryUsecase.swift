//
//  HomeTabViewUsecase.swift
//  Reminda
//
//  Created by Dung-pc on 07/10/2024.
//

import Foundation
import Combine

protocol CategoryUsecase {
    func getPhoto(searchTerm: String, pageSize: Int)
}
