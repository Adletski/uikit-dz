// MyInfoModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

final class MyInfoModel {
    let name: String
    let surname: String
    let phone: String?
    let legSize: Int?
    let birthday: Date?
    let email: String?

    init(name: String, surname: String, phone: String?, legSize: Int?, birthday: Date?, email: String?) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.legSize = legSize
        self.birthday = birthday
        self.email = email
    }
}
