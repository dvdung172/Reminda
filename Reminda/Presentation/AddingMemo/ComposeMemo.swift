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
//    @State private var enteredText: NSAttributedString = NSAttributedString(string: "**mock**")
    @State private var enteredText: String = ""
    @ObservedObject private var vm = ComposeMemoViewModel()

    private let memo: MemoItem?
    
    init(memo: MemoItem? = nil) {
        self.memo = memo
        
        if let memo = memo {
            self._enteredText = State(initialValue: memo.content ?? "")
            self.vm.setUpVM(memoItem: memo)
            return
        }
        self._enteredText = State(initialValue: "")
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
//                EditableView(text: $enteredText)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    RButton(action: onEndEditing, label: {
                        Text("Done")
                    })
                }
            }
        }
    }
    
    private func onEndEditing() {
        UIApplication.shared.endEditing()
        if let _ = self.memo {
            vm.update()
            return
        }
        vm.add()
    }
}

#Preview {
    ComposeMemo()
}
