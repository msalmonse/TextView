//
//  TextViewState.swift
//  
//
//  Created by Michael Salmon on 2019-09-23.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
public class TextViewState: ObservableObject, Identifiable {
    public let id = UUID()

    @Published
    public var text: String

    public var backgroundColor = UIColor.systemBackground
    public var font: UIFont
    public var isEditable = true
    public var isScrollEnabled = true
    public var isUserInteractionEnabled = true
    public var textColor = UIColor.label

    // From UITextInputTraits
    public var autocapitalizationType = UITextAutocapitalizationType.sentences
    public var autocorrectionType = UITextAutocorrectionType.default
    public var spellCheckingType = UITextSpellCheckingType.default

    // Undo manager from UITextView
    @Published
    public var undomanager: UndoManager?

    public init(_ text: String, font: UIFont) {
        self.text = text
        self.font = font
    }
}
