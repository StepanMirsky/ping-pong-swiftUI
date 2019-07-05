//
//  GamesView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct GamesView : View {
    let gameService: GameService = GameServiceImpl()

    var userName: String?
    @State var games: [GameViewModel] = []
    
    var body: some View {
        List(games) { game in
            NavigationLink(destination: GameView(game: game)) {
                HistoryRow(game: game)
            }
        }
        .listStyle(.grouped)
            .onAppear {
                self.load()
        }.navigationBarItems(
            trailing: Button("Обновить") {
                self.load()
            }
        ).navigationBarTitle(Text("Игры"))
    }

    func load() {
        if let userName = self.userName {
            self.gameService.getGames(by: userName) { result in
                switch result {
                case .success(let games):
                    self.games = games
                case .failure:
                    break
                }
            }
        } else {
            self.gameService.getGames { result in
                switch result {
                case .success(let games):
                    self.games = games
                case .failure:
                    break
                }
            }
        }
    }
}

//NavigationLink(destination: GameView(game: Game(homeUser: homeUser, awayUser: user, homeScore: 0, awayScore: 0, isFinished: false))) {
//    Text("Вызвать")
//        .font(.system(.headline, design: .rounded))
//}

