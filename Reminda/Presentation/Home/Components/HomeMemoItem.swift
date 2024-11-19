//
//  HomeMemoItem.swift
//  Reminda
//
//  Created by Dung-pc on 09/10/2024.
//

import SwiftUI

struct HomeMemoItem: View {
    let text: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 0) {
            Text(text)
                .lineLimit(5)
        }
        .padding(8)
        .fillParentSize(alignment: .leading)
        .background(color)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}

#Preview {
    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam scelerisque velit id lorem tristique rhoncus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vitae arcu ante. Mauris in ligula mi. Sed a ante et massa tincidunt bibendum vel vel arcu. Proin eget tortor pulvinar, tincidunt velit eu, scelerisque dolor. Proin vel eros quis diam tincidunt semper venenatis vel augue. Aliquam posuere et lorem vel aliquam."
    return HomeMemoItem(
        text: text,
        color: Color.blue
    )
}
