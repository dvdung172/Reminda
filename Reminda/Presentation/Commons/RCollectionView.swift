//
//  RCollectionView.swift
//  Reminda
//
//  Created by Dung-pc on 19/11/2024.
//

import SwiftUI

struct RCollectionView<ItemView>: View where ItemView: View {
    var listItem: [MemoItem]
    var crossAxisCount: Int = 2
    var crossAxisSpacing: CGFloat = 10
    var mainAxisSpacing: CGFloat = 10
    
    @ViewBuilder var content: () -> ItemView
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(alignment: .top, spacing: mainAxisSpacing){
                ForEach(0..<crossAxisCount, id: \.self) { column in
                    let listItem = listItem.enumerated().filter { index, _ in
                        index % crossAxisCount == column
                    }.map { $0.element }
                    LazyVStack (spacing: crossAxisSpacing) {
                        ForEach(listItem, id: \.self) { item in
                            GeometryReader { proxy in
                                content()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RCollectionView(
        listItem: (1...100).map {
            if $0 % 2 == 0 {
                MemoItem(id: "\($0)", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam scelerisque velit id lorem tristique rhoncus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vitae arcu ante. Mauris in ligula mi. Sed a ante et massa tincidunt bibendum vel vel arcu. Proin eget tortor pulvinar, tincidunt velit eu, scelerisque dolor. Proin vel eros quis diam tincidunt semper venenatis vel augue. Aliquam posuere et lorem vel aliquam." )
            }
            else {
                MemoItem(id: "\($0)", content: "Item \($0)" )
            }
        },
        crossAxisCount: 2) {
        }
}
