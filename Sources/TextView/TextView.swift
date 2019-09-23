//
//  TextView.swift
//  
//
//  Created by Michael Salmon on 2019-09-23.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct TextView: View {
    @ObservedObject
    var state: TextViewState
    @Environment(\.presentationMode)
    var mode: Binding<PresentationMode>

    public init(_ state: TextViewState) {
        self.state = state
    }

    func doDismiss() {
        mode.wrappedValue.dismiss()
    }

    public var body: some View {
        TextViewController(state, { self.doDismiss() })
    }
}
