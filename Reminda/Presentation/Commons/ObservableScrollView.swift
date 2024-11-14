//
//  ObservableScrollView.swift
//  Reminda
//
//  Created by Dung-pc on 01/11/2024.
//

import SwiftUI


// PreferenceKey to tracking scroll offset
struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct ObservableScrollView<Content>: View where Content : View {
    @Namespace private var scrollSpace
    @Binding var scrollOffset: CGFloat
    let content: () -> Content
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geometry.frame(in: .named(scrollSpace)).minY)
                }
                .frame(height: 0)
                content()
            }
        }
        .coordinateSpace(name: scrollSpace)
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            self.scrollOffset = value
        }
    }
}

#Preview {
    @State var scrollOffset: CGFloat = CGFloat.zero
    
    return ObservableScrollView(scrollOffset: $scrollOffset) {
        VStack (alignment: .center) {
            Text("I'm observable \(scrollOffset)")
            Spacer()
        }
        .frame(height: 1000)
    }
}
