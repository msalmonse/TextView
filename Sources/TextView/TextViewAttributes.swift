//
//  TextViewAttributes.swift
//  
//
//  Created by Michael Salmon on 2019-09-24.
//

import SwiftUI
import UIKit

public enum TextViewAttributes {
    case autocapitalizationType(UITextAutocapitalizationType)
    case autocorrectionType(UITextAutocorrectionType)
    case backgroundColor(UIColor)
    case font(UIFont)
    case isEditable(Bool)
    case isScrollEnabled(Bool)
    case isUserInteractionEnabled(Bool)
    case spellCheckingType(UITextSpellCheckingType)
    case textColor(UIColor)
}

@available(iOS 13.0, *)
public extension TextViewState {
    func set(_ attribute: TextViewAttributes) -> TextViewState {
        switch attribute {
        case let .autocapitalizationType(val): autocapitalizationType = val
        case let .autocorrectionType(val): autocorrectionType = val
        case let .backgroundColor(val): backgroundColor = val
        case let .font(val): font = val
        case let .isEditable(val): isEditable = val
        case let .isScrollEnabled(val): isScrollEnabled = val
        case let .isUserInteractionEnabled(val): isUserInteractionEnabled = val
        case let .spellCheckingType(val): spellCheckingType = val
        case let .textColor(val): textColor = val
        }
        
        return self
    }
}
