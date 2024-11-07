//
//  AddingMemo.swift
//  Reminda
//
//  Created by Dung-pc on 04/11/2024.
//

import SwiftUI

struct AddingMemo: View {
    enum FocusedField {
        case field
    }
    @EnvironmentObject private var router: Router

    @State private var enteredText = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        EditableView(text: $enteredText)
            .fillParentSize()
    }
}

#Preview {
    AddingMemo()
}
