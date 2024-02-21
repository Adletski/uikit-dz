// TextField.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class TextField: UITextField {
    private let inset: CGFloat = 10

    // placeholder position
    override func textRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: inset, dy: inset)
    }

    // text position
    override func editingRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: inset, dy: inset)
    }

    override func placeholderRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: inset, dy: inset)
    }
}
