//
//  TextView.swift
//  
//
//  Created by Michael Salmon on 2019-09-23.
//

import Foundation
import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct TextView: View {
    @ObservedObject
    var state: TextViewState

    public init(_ state: TextViewState) {
        self.state = state
    }

    public var body: some View {
        TextViewController(state)
    }
}
