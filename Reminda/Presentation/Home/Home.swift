//
//  Home.swift
//  Reminda
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var router: Router
    
    @State private var text = ""
    @State private var bold = false
    @State private var italic = false
    @State private var fontSize = 12.0
    
    @State private var selection: Category?
    
    @ObservedObject var vm = HomeViewModel()
    @State var hideNavigationBar: Bool = false
    
    var body: some View {
        VStack(spacing: 10){
            if !vm.categories.isEmpty {
                HomeTabList(tabs: vm.categories, selection: $selection)
                TabView(selection: $selection) {
                    ForEach(vm.categories, id:  \.self) { content in
                        ScrollView(showsIndicators: false) {
                            HomeMemoGridView()
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
            Text("change")
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 31)) {
                        hideNavigationBar.toggle()
                    }
                }
        }
        .fillParentSize()
        .padding(.horizontal)
//        .navigationTitle("Notes")
        .navigationBarTitle("Hello World", displayMode: hideNavigationBar ? .large : .inline)
//        .navigationBarTitleDisplayMode(hideNavigationBar ? .large : .inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "line.3.horizontal")
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            vm.getListCategories()
        }
    }
}

#Preview {
    Home()
        .previewSupporter()
}
