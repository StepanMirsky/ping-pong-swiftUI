//
//  GameService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation
import Moya

protocol GameService {
    func getGames(_ result: @escaping ResultClosure<[GameViewModel]>)

    func getGames(by userName: String, result: @escaping ResultClosure<[GameViewModel]>)

    func create(_ awayUserName: String, result: @escaping ResultClosure<GameViewModel>)

    func updateGame(_ game: GameViewModel, result: @escaping ResultClosure<GameViewModel>)
}

class GameServiceImpl: GameService {
    let storage = Storage.shared
    let userDefaults = UserDefaults.standard

    func getGames(_ result: @escaping ResultClosure<[GameViewModel]>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.getGames) { requestResult in
            switch requestResult {
            case .success(let responce):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                if let games: [Game] = try? decoder.decode([Game].self, from: responce.data) {
                    result(.success(games.map({ GameViewModel(game: $0) })))
                }
            default:
                break
            }
        }
    }

    func getGames(by userName: String, result: @escaping ResultClosure<[GameViewModel]>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.getGames) { requestResult in
            switch requestResult {
            case .success(let responce):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                if let games: [Game] = try? decoder.decode([Game].self, from: responce.data) {
                    result(.success(games.filter({ $0.homeUser.login == userName || $0.awayUser.login == userName }).map({ GameViewModel(game: $0) })))
                }
            default:
                break
            }
        }
    }

    func create(_ awayUserName: String, result: @escaping ResultClosure<GameViewModel>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.createGame(awayUserName: awayUserName)) { requestResult in
            switch requestResult {
            case .success(let responce):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let game: Game = try? decoder.decode(Game.self, from: responce.data) {
                    result(.success(GameViewModel(game: game)))
                }
            default:
                break
            }
        }
    }

    func updateGame(_ game: GameViewModel, result: @escaping ResultClosure<GameViewModel>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.updateGame(params: UpdateGameParams(id: game.gameId, homeScore: Int(game.homeScore), awayScore: Int(game.awayScore)))) { requestResult in
            switch requestResult {
            case .success(let responce):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let game: Game = try? decoder.decode(Game.self, from: responce.data) {
                    result(.success(GameViewModel(game: game)))
                }
            default:
                break
            }
        }
    }
}
