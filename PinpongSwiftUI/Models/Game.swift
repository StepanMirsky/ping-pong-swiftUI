//
//  Game.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 05/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation

struct Game: Decodable {
    let id: Int
    let homeUser: User
    let homeScore: Int
    let awayUser: User
    let awayScore: Int
    let isFinished: Bool
}
