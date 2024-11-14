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
    @EnvironmentObject private var router: Router
    
    @State private var enteredText: NSAttributedString = NSAttributedString(string: "")
    
    var body: some View {
        VStack {
            EditableView(attributedText: $enteredText)
                .fillParentSize()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Text("Done")
                })
            }
        }
    }
}

#Preview {
    ComposeMemo()
}
