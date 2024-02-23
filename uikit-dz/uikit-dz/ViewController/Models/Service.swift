// Service.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Общий сервис для получения данных с сервера
final class Service {
    func getProfilePhotos() -> [String] {
        [
            "star1",
            "star2",
            "star3",
            "star4",
            "star1",
            "star2",
            "star3",
            "star4",
            "star1",
            "star2",
            "star3",
            "star4",
            "star1",
            "star2",
            "star3",
            "star4",
            "star1",
            "star2",
            "star3",
            "star4",
            "star1",
            "star2",
            "star3",
            "star4"
        ]
    }

    func getNotificationToday() -> [Photo] {
        [
            Photo(
                profileImageName: "story2",
                text: "lavanda123 понравился ваш комментарий: \"Очень красиво!\" 12ч",
                postImageName: "ocean"
            ),
            Photo(
                profileImageName: "story2",
                text: "lavanda123 упомянул(-a) вас в комментарий: @rm Спасибо! 12ч",
                postImageName: "ocean"
            )
        ]
    }

    func getNotificationThisWeek() -> [Any] {
        [
            Photo(
                profileImageName: "storyTwo",
                text: "lavanda123 понравился ваш комментарий: \"Это где?\" 3д.",
                postImageName: "ocean"
            ),
            Button(
                profileImageName: "storyTwo",
                text: "12miho появился(-ась) в RMLink. Вы можете быть знакомы. 3д.",
                buttonState: .enabled,
                isButton: true
            ),
            Button(
                profileImageName: "storyTwo",
                text: "lavanda123 подписался(-ась) на ваши новости. 7д.",
                buttonState: .disable,
                isButton: true
            ),
            Photo(
                profileImageName: "storyTwo",
                text: "lavanda123 понравился ваш комментарий: \"Ты вернулась?\"",
                postImageName: "ocean"
            ),
            Button(
                profileImageName: "storyTwo",
                text: "markS появился(-ась) в RMLink. Вы можете быть знакомы. 8д.",
                buttonState: .enabled,
                isButton: true
            ),
            Button(
                profileImageName: "storyTwo",
                text: "sv_neit появился(-ась) в RMLink. Вы можете быть знакомы. 3д.",
                buttonState: .enabled,
                isButton: true
            )
        ]
    }
}
