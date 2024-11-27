//
//  EditableView.swift
//  Reminda
//
//  Created by Dung-pc on 07/11/2024.
//

import SwiftUI

struct EditableView: UIViewRepresentable {
    //    @Binding var attributedText: NSAttributedString
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16)
        textView.isEditable = true
        textView.isScrollEnabled = true
        //        textView.attributedText = attributedText
        textView.text = text
        textView.delegate = context.coordinator
        textView.becomeFirstResponder()
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        //        uiView.attributedText = attributedText
        uiView.text = text
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
            //            parent.attributedText = textView.attributedText
            parent.text = textView.text
        }
    }
}

#Preview {
    return EditableView(text: .constant("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam scelerisque velit id lorem tristique rhoncus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vitae arcu ante. Mauris in ligula mi. Sed a ante et massa tincidunt bibendum vel vel arcu. xProin eget tortor pulvinar, tincidunt velit eu, scelerisque dolor. Proin vel eros quis diam tincidunt semper venenatis vel augue. Aliquam posuere et lorem vel aliquam."))
}
