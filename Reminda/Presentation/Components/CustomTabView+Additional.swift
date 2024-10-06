//
//  CustomTabView+Additional.swift
//  Reminda
//
//  Created by Dung-pc on 06/10/2024.
//

import SwiftUI

struct TabViewItem: Hashable {
    let title: String
}

struct Tab: Identifiable {
    var content: AnyView
    var tag: TabViewItem
    var id = UUID()
}

// MARK: - Modifier
struct TabViewItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [TabViewItem] = []
    static func reduce(value: inout [TabViewItem], nextValue: () -> [TabViewItem]) {
        value += nextValue()
    }
}

struct TabViewItemViewModifier: ViewModifier {
    let tab: TabViewItem
    func body(content: Content) -> some View {
        content.preference(key: TabViewItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabViewItem(_ tab: TabViewItem) -> Tab {
        Tab(content: AnyView(self.modifier(TabViewItemViewModifier(tab: tab))), tag: tab)
    }
}

// MARK: - ResultBuilder: The @resultBuilder will then build your array of your view & tag which you'll be using inside the container.
@resultBuilder
struct TabsBuilder {
    static func buildBlock(_ components: Tab...) -> [Tab] {
        return components
    }
    static func buildEither(first component: Tab) -> Tab {
        return component
    }
    static func buildEither(second component: Tab) -> Tab {
        return component
    }
}
