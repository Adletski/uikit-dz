// Label.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class Label: UILabel {
    init(xC: Int, yC: Int, wX: Int, hX: Int, text: String) {
        super.init(frame: CGRect(x: xC, y: yC, width: wX, height: hX))
        self.text = text
        numberOfLines = 0
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
