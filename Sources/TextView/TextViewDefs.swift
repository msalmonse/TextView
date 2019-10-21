//
//  TextViewDefs.swift
//  
//
//  Created by Michael Salmon on 2019-10-20.
//

import Foundation

#if os(iOS)

import UIKit

public typealias TVColor = UIColor
public typealias TVFont = UIFont

@available(iOS 13.0, *)
let labelColor = UIColor.label
@available(iOS 13.0, *)
let systemBackground = UIColor.systemBackground

#elseif os(macOS)

import AppKit

public typealias TVColor = NSColor
public typealias TVFont = NSFont

let labelColor = NSColor.labelColor
let systemBackground = NSColor.underPageBackgroundColor

#endif
