// Button.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Модель для ячейки с кнопкой
struct Button {
    /// название картки профиля
    let profileImageName: String
    /// текст для тайтла
    let text: String
    /// стейт для кнопки
    let buttonState: ButtonState
    /// кнопка это или нет
    let isButton: Bool
}
