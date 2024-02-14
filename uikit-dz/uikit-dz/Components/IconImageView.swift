// IconImageView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class IconImageView: UIImageView {
    init(xC: Int, yC: Int, wX: Int = 75, hX: Int = 75, image: UIImage?) {
        super.init(frame: CGRect(x: xC, y: yC, width: wX, height: hX))
        self.image = image
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
