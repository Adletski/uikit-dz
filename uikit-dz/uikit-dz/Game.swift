// Game.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Модель для игры, которая содержит текст и функцию по переворачиванию строки
struct Game {
    // MARK: - Public properties

    let text: String

    // MARK: - Public methods

    func makeReverse(text: String) -> String {
        String(text.reversed())
    }
}
