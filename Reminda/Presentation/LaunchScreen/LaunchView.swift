//
//  ContentView.swift
//  Reminda
//
//  Created by Dung-pc on 29/09/2024.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "REMINDA".map { String($0) }
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            //            Image(systemName: "note")
            //                .resizable()
            //                .frame(width: 100, height: 100)
            //                .foregroundColor(Color.launch.accent)
            if showLoadingText {
                HStack(spacing: 0) {
                    ForEach(loadingText.indices) { index in
                        Text(loadingText[index])
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.launch.foreground)
                            .offset(y: counter == index ? -5 : 0)
                    }
                }
                .transition(AnyTransition.scale.animation(.easeIn))
            }
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                
                if counter == lastIndex {
                    counter = 0
                    showLaunchView = false
                } else {
                    counter += 1
                }
            }
        })
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
        .previewSupporter()
}
