//
//  RCollectionView.swift
//  Reminda
//
//  Created by Dung-pc on 19/11/2024.
//

import SwiftUI

struct RCollectionView<Item, ItemView, Id>: View where ItemView: View, Id: Hashable {
    var listItem: [Item] 
    var idKeyPath: KeyPath<Item, Id>
    var crossAxisCount: Int = 2
    var crossAxisSpacing: CGFloat = 10
    var mainAxisSpacing: CGFloat = 10
    
    @ViewBuilder var content: (Item) -> ItemView
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(alignment: .top, spacing: mainAxisSpacing){
                ForEach(0..<crossAxisCount, id: \.self) { column in
                    let listItem = listItem.enumerated().filter { index, _ in
                        index % crossAxisCount == column
                    }.map { $0.element }
                    LazyVStack (spacing: crossAxisSpacing) {
                        ForEach(listItem, id: idKeyPath) { item in
//                            GeometryReader { proxy in
                                content(item)
//                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let listItem = (1...100).map {
        if $0 % 2 == 0 {
            MemoItem(id: "\($0)", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam scelerisque velit id lorem tristique rhoncus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vitae arcu ante. Mauris in ligula mi. Sed a ante et massa tincidunt bibendum vel vel arcu. Proin eget tortor pulvinar, tincidunt velit eu, scelerisque dolor. Proin vel eros quis diam tincidunt semper venenatis vel augue. Aliquam posuere et lorem vel aliquam.", dateAdded: Date(), dateUpdate: Date())
        }
        else {
            MemoItem(id: "\($0)", content: "Item \($0)", dateAdded: Date(), dateUpdate: Date())
        }
    }
    return RCollectionView(
        listItem: listItem,
        idKeyPath: \.self,
        crossAxisCount: 2) { item in
            HomeMemoItem(text: item.content ?? "", color: Color.red)
        }
}
