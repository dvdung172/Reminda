//
//  HomeMemoGridView.swift
//  Reminda
//
//  Created by Dung-pc on 09/10/2024.
//

import SwiftUI

struct HomeMemoGridView: View {
    var listItem: [MemoItem]
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 10)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(listItem, id: \.self) { item in
                    HomeMemoItem(text: item.content ?? "", color: Color.blue)
                }
            }
        }
    }
}

#Preview {
    HomeMemoGridView(listItem: (1...100).map {
        if $0 % 2 == 0 {
            MemoItem(id: "\($0)", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam scelerisque velit id lorem tristique rhoncus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vitae arcu ante. Mauris in ligula mi. Sed a ante et massa tincidunt bibendum vel vel arcu. Proin eget tortor pulvinar, tincidunt velit eu, scelerisque dolor. Proin vel eros quis diam tincidunt semper venenatis vel augue. Aliquam posuere et lorem vel aliquam." )
        }
        else {
            MemoItem(id: "\($0)", content: "Item \($0)" )
        }
    })
}
