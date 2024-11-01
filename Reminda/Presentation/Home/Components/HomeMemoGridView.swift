//
//  HomeMemoGridView.swift
//  Reminda
//
//  Created by Dung-pc on 09/10/2024.
//

import SwiftUI

struct HomeMemoGridView: View {
    
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(data, id: \.self) { item in
                HomeMemoItem()
            }
        }
    }
}

#Preview {
    ScrollView {
        HomeMemoGridView()
    }
}
