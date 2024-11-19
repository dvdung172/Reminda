//
//  Home.swift
//  Reminda
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI

struct Home: View {
    @State private var selection: Category?
    @State var hideNavigationBar: Bool = false
    
    @ObservedObject private var vm = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10){
                if !vm.categories.isEmpty {
                    HomeTabList(tabs: vm.categories, selection: $selection)
                    TabView(selection: $selection) {
                        ForEach(vm.categories, id:  \.self) { category in
                            let listItems = (1...100).map { MemoItem(id: "\($0)", content: "\($0)" ) }
                            HomeMemoGridView(listItem: listItems)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .fillParentSize()
            .padding(.horizontal)
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "line.3.horizontal")
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .overlay(alignment: .bottomTrailing) {
                NavigationLink(
                    destination: ComposeMemo(),
                    label: {
                    CircleButtonView(iconName: "plus")
                })
                .padding()
            }
        }
    }
}

#Preview {
    Home()
        .previewSupporter()
}
