//
//  TextViewController.swift
//  
//
//  Created by Michael Salmon on 2019-09-23.
//

import SwiftUI
import UIKit

@available(iOS 13.0, *)
struct TextViewController: UIViewRepresentable {
    @ObservedObject
    var state: TextViewState

    let doDismiss: (() -> Void)?

    public init(_ state: TextViewState, _ doDismiss: (() -> Void)? = nil) {
        self.state = state
        self.doDismiss = doDismiss
    }

    func dismiss() {
        if doDismiss != nil { doDismiss!() }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIView(context: Context) -> UITextView {
        let controller = UITextView()
        controller.delegate = context.coordinator

        controller.font = state.font
        controller.isScrollEnabled = state.isScrollEnabled
        controller.isEditable = state.isEditable
        controller.isUserInteractionEnabled = state.isUserInteractionEnabled
        controller.backgroundColor = state.backgroundColor

        return controller
    }

    public func updateUIView(_ controller: UITextView, context: Context) {
        controller.text = state.text
    }

    public class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextViewController

        public init(_ controller: TextViewController) {
            parent = controller
        }

        public func textView(
            _ controller: UITextView,
            shouldChangeTextIn range: NSRange,
            replacementText text: String
        ) -> Bool {
            return true
        }

        public func textViewDidChange(_ controller: UITextView) {
            parent.state.text = controller.text
        }
    }
}
