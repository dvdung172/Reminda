//
//  Remida_NavigationBarModifier.swift
//  Reminda
//
//  Created by Dung-pc on 01/11/2024.
//

import SwiftUI

struct RemidaNavigationBarModifier: ViewModifier {
    @State private var largeTitle = true
    
    func body(content: Content) -> some View {
        NavigationStack {
            VStack {
                Text("Hello, SwiftUI!")
                
                Button("Toggle Display Mode") {
                    withAnimation {
                        largeTitle.toggle()
                    }
                }
                ScrollView {
                    VStack {
                        // Using GeometryReader to track the scroll position
                        GeometryReader { geometry in
                            Color.clear
                                .preference(key: ScrollViewOffsetPreferenceKey.self, value: geometry.frame(in: .global).minY)
                        }
                        .frame(height: 0) // Hidden view for tracking
                        
                        ForEach(0..<100) { index in
                            Text("Item \(index)")
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                    }
                }
                .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                    // Change the title based on scroll offset
                    withAnimation {
                        largeTitle = value < -100 ? false : true
                    }
                }
            }
            .padding(.top, largeTitle ? 80 : 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: largeTitle ? .topLeading : .top) {
                Text("Title")
                    .font(largeTitle ? .largeTitle : .headline)
                    .bold()
                    .padding(.top, largeTitle ? 30 : 10)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    Text("PreviewModifier")
        .modifier(RemidaNavigationBarModifier())
}

