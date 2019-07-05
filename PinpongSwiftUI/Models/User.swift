//
//  User.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 05/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let login: String
    let photo: String?
    let rating: Int
}
