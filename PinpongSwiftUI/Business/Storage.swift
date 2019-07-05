//
//  Storage.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import UIKit

class Storage {
    static let shared = Storage()

    var users: [UserViewModel] = []
    var games: [GameViewModel] = []

    init() {
        users = [
            UserViewModel(
                name: "Серега",
                rating: 500,
                image: UIImage(named: "defaultImage")!,
                lastGames: [
                    ShortGame(isWin: true),
                    ShortGame(isWin: false),
                    ShortGame(isWin: false)
                ]
            ),
            UserViewModel(
                name: "Федя",
                rating: 1000,
                image: UIImage(named: "personOne")!,
                lastGames: [
                    ShortGame(isWin: true),
                    ShortGame(isWin: false),
                    ShortGame(isWin: false),
                    ShortGame(isWin: true),
                    ShortGame(isWin: true)
                ]
            ),
            UserViewModel(
                name: "Антон",
                rating: 1500,
                image: UIImage(named: "defaultImage")!,
                lastGames: [
                    ShortGame(isWin: true),
                    ShortGame(isWin: true),
                    ShortGame(isWin: false),
                    ShortGame(isWin: true)
                ]
            ),
            UserViewModel(
                name: "Вика",
                rating: 800,
                image: UIImage(named: "personTwo")!,
                lastGames: [
                    ShortGame(isWin: true),
                    ShortGame(isWin: false)            ]
            ),
            UserViewModel(
                name: "Гриша",
                rating: 450,
                image: UIImage(named: "defaultImage")!,
                lastGames: []
            )
        ]
    }
}
