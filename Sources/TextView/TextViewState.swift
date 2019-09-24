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

    var backgroundColor = UIColor.systemBackground
    var font: UIFont
    var isEditable = true
    var isScrollEnabled = true
    var isUserInteractionEnabled = true
    var textColor = UIColor.label

    // From UITextInputTraits
    var autocapitalizationType = UITextAutocapitalizationType.sentences
    var autocorrectionType = UITextAutocorrectionType.default
    var spellCheckingType = UITextSpellCheckingType.default

    // Undo manager from UITextView
    @Published
    public var undomanager: UndoManager?

    public init(_ text: String, font: UIFont) {
        self.text = text
        self.font = font
    }
}
