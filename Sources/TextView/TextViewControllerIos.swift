//
//  TextViewControllerIos.swift
//  
//
//  Created by Michael Salmon on 2019-09-23.
//

import SwiftUI

#if os(iOS)
import UIKit

@available(iOS 13.0, *)
struct TextViewController: UIViewRepresentable {
    @ObservedObject
    var state: TextViewState


    public init(_ state: TextViewState) {
        self.state = state
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIView(context: Context) -> UITextView {
        let controller = UITextView()
        controller.delegate = context.coordinator

        controller.autocapitalizationType = state.autocapitalizationType
        controller.autocorrectionType = state.autocorrectionType
        controller.backgroundColor = state.backgroundColor
        controller.font = state.font
        controller.isEditable = state.isEditable
        controller.isScrollEnabled = state.isScrollEnabled
        controller.isUserInteractionEnabled = state.isUserInteractionEnabled
        controller.spellCheckingType = state.spellCheckingType
        controller.textColor = state.textColor

        state.undomanager = controller.undoManager

        return controller
    }

    public func updateUIView(_ controller: UITextView, context: Context) {
        if controller.text != state.text { controller.text = state.text }
    }

    public class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextViewController

        public init(_ controller: TextViewController) {
            parent = controller
        }

        public func textViewDidChange(_ controller: UITextView) {
            if parent.state.text != controller.text { parent.state.text = controller.text }
        }
    }
}
#endif
