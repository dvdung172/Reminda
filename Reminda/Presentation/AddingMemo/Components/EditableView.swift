//
//  EditableView.swift
//  Reminda
//
//  Created by Dung-pc on 07/11/2024.
//

import SwiftUI

struct EditableView: UIViewRepresentable {
    @Binding var attributedText: NSAttributedString

    func makeUIView(context: Context) -> UITextView {

        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16)
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.attributedText = attributedText
        textView.delegate = context.coordinator
        textView.becomeFirstResponder()
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = attributedText
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: EditableView

        init(_ parent: EditableView) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.attributedText = textView.attributedText
        }
    }
}

#Preview {
    return EditableView(attributedText: .constant(NSMutableAttributedString.init(string: "")))
}
