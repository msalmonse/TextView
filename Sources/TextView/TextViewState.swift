//
//  TextViewState.swift
//  
//
//  Created by Michael Salmon on 2019-09-23.
//

import SwiftUI
import Combine

@available(iOS 13.0, macOS 10.15, *)
public class TextViewState: ObservableObject, Identifiable {
    public let id = UUID()

    @Published
    public var text: String

    public var backgroundColor = systemBackground
    public var font: TVFont?
    public var isEditable = true
    public var isScrollEnabled = true
    public var isUserInteractionEnabled = true
    public var textColor = labelColor

    #if os(iOS)
    // From UITextInputTraits
    public var autocapitalizationType = UITextAutocapitalizationType.sentences
    public var autocorrectionType = UITextAutocorrectionType.default
    public var spellCheckingType = UITextSpellCheckingType.default
    #endif

    // Undo manager from UITextView
    @Published
    public var undomanager: UndoManager?

    public init(_ text: String, font: TVFont? = nil) {
        self.text = text
        self.font = font
    }
}
