//
//  TextViewAttributes.swift
//  
//
//  Created by Michael Salmon on 2019-09-24.
//

import SwiftUI

public enum TextViewAttributes {
    case backgroundColor(TVColor)
    case font(TVFont)
    case isEditable(Bool)
    case isScrollEnabled(Bool)
    case isUserInteractionEnabled(Bool)
    case textColor(TVColor)
    #if os(iOS)
    case autocapitalizationType(UITextAutocapitalizationType)
    case autocorrectionType(UITextAutocorrectionType)
    case spellCheckingType(UITextSpellCheckingType)
    #endif
}

@available(iOS 13.0, macOS 10.15, *)
public extension TextViewState {
    func set(_ attribute: TextViewAttributes) -> TextViewState {
        switch attribute {
        case let .backgroundColor(val): backgroundColor = val
        case let .font(val): font = val
        case let .isEditable(val): isEditable = val
        case let .isScrollEnabled(val): isScrollEnabled = val
        case let .isUserInteractionEnabled(val): isUserInteractionEnabled = val
        case let .textColor(val): textColor = val
        #if os(iOS)
        case let .spellCheckingType(val): spellCheckingType = val
        case let .autocapitalizationType(val): autocapitalizationType = val
        case let .autocorrectionType(val): autocorrectionType = val
        #endif
        }
        
        return self
    }
}
