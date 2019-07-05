//
//  GameService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation

protocol GameService {
    func getGames(_ result: @escaping ResultClosure<[GameViewModel]>)

    func getGames(by userName: String, result: @escaping ResultClosure<[GameViewModel]>)

    func create(_ game: GameViewModel, result: @escaping ResultClosure<GameViewModel>)

    func updateGame(_ game: GameViewModel, result: @escaping ResultClosure<GameViewModel>)
}

class GameServiceImpl: GameService {
    let storage = Storage.shared
    let userDefaults = UserDefaults.standard

    func getGames(_ result: @escaping ResultClosure<[GameViewModel]>) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            result(.success(self.storage.games))
        }
    }

    func getGames(by userName: String, result: @escaping ResultClosure<[GameViewModel]>) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            result(.success(self.storage.games.filter({ $0.homeUser.name == userName || $0.awayUser.name == userName })))
        }
    }

    func create(_ game: GameViewModel, result: @escaping ResultClosure<GameViewModel>) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            self.storage.games.append(game)
            result(.success(game))
        }
    }

    func updateGame(_ game: GameViewModel, result: @escaping ResultClosure<GameViewModel>) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            if let index = self.storage.games.firstIndex(where: { $0.id == game.id }) {
                self.storage.games[index] = game
                result(.success(game))
            } else {
                result(.failure(.textualError("Игра не найдена")))
            }
        }
    }
}
