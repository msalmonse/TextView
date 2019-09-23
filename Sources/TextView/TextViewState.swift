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

    let font: UIFont
    let isScrollEnabled = true
    let isEditable = true
    let isUserInteractionEnabled = true
    let backgroundColor = UIColor.systemBackground

    public init(_ text: String, font: UIFont) {
        self.text = text
        self.font = font
    }
}
