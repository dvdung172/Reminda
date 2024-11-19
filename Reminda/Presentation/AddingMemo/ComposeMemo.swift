//
//  AddingMemo.swift
//  Reminda
//
//  Created by Dung-pc on 04/11/2024.
//

import SwiftUI

struct ComposeMemo: View {
    enum FocusedField {
        case field
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State private var enteredText: NSAttributedString = NSAttributedString(string: "")
    @ObservedObject private var vm = ComposeMemoViewModel()

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                EditableView(attributedText: $enteredText)
                    .fillParentSize()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Done")
                    })
                }
            }
        }
        .onChange(of: enteredText) { _ in
            vm.add(title: nil, content: enteredText.string, category: nil)
        }
    }
}

#Preview {
    ComposeMemo()
}
