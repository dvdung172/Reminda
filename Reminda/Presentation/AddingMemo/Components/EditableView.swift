//
//  EditableView.swift
//  Reminda
//
//  Created by Dung-pc on 07/11/2024.
//

import SwiftUI
import UIKit

//class MyViewController: UIViewController, UITextViewDelegate {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let textView = UITextView()
//        textView.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 200)
//        textView.backgroundColor = .lightGray
//        textView.font = UIFont.systemFont(ofSize: 16)
//        textView.textColor = .black
//        textView.text = "rrr"
//        textView.delegate = self
//        view.addSubview(textView)
//    }
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.textColor == .lightGray {
//            textView.text = ""
//            textView.textColor = .black
//        }
//    }
//}
//
//
//struct EditableView: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> MyViewController {
//        return MyViewController()
//    }
//    
//    func updateUIViewController(_ uiViewController: MyViewController, context: Context) {
//        // Update the view controller if needed
//    }
//}
//
#Preview {
    return EditableView(text: Binding(projectedValue: .constant("")))
}
import SwiftUI

struct EditableView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let attributed: NSMutableAttributedString = .init(string: text)

        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16)
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.attributedText = attributed
        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
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
            parent.text = textView.text
        }
    }
}
