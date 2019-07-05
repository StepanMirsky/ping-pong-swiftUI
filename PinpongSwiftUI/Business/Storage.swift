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

        games = [
            GameViewModel(
                homeUser: users[0],
                awayUser: users[1],
                homeScore: 5,
                awayScore: 3,
                isFinished: false
            ),
            GameViewModel(
                homeUser: users[1],
                awayUser: users[2],
                homeScore: 11,
                awayScore: 3,
                isFinished: true
            ),
            GameViewModel(
                homeUser: users[2],
                awayUser: users[3],
                homeScore: 5,
                awayScore: 11,
                isFinished: true
            ),
            GameViewModel(
                homeUser: users[2],
                awayUser: users[0],
                homeScore: 11,
                awayScore: 7,
                isFinished: true
            ),
            GameViewModel(
                homeUser: users[3],
                awayUser: users[1],
                homeScore: 15,
                awayScore: 13,
                isFinished: true
            )
        ]
    }
}
