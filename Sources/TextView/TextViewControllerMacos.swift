//
//  TextViewControllerMacos.swift
//  
//
//  Created by Michael Salmon on 2019-10-20.
//

import SwiftUI

#if os(macOS)
import AppKit

@available(OSX 10.15, *)
struct TextViewController: NSViewRepresentable {
    @ObservedObject
    var state: TextViewState

    public init(_ state: TextViewState) {
        self.state = state
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeNSView(context: Context) -> NSTextView {
        let controller = NSTextView(frame: NSRect.infinite)
        controller.delegate = context.coordinator
        context.coordinator.setView(controller)

        controller.backgroundColor = state.backgroundColor
        controller.font = state.font
        controller.isEditable = state.isEditable
        controller.textColor = state.textColor

        state.undomanager = controller.undoManager

        return controller
    }

    public func updateNSView(_ controller: NSTextView, context: Context) {
        if controller.string != state.text { controller.string = state.text }
    }

    public static func dismantleNSView(_ controller: NSTextView, coordinator: Coordinator) {
        let text = controller.string
        let state = coordinator.parent.state
        coordinator.setView(nil)
        if text != state.text { state.text = text }
    }

    public class Coordinator: NSObject, NSTextViewDelegate {
        var parent: TextViewController
        weak var nsView: NSTextView?

        public init(_ controller: TextViewController) {
            parent = controller
        }

        public func setView(_ nsView: NSTextView?) {
            self.nsView = nsView
        }

        public func textDidChange(_ notification: Notification) {
            if let text = nsView?.string {
                if text != parent.state.text { parent.state.text = text }
            }
        }
    }

}
#endif
