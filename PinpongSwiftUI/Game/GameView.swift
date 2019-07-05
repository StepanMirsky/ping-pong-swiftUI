//
//  ContentView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct GameViewModel: Identifiable {
    let id = UUID()
    let homeUser: UserViewModel
    let awayUser: UserViewModel
    var homeScore: UInt
    var awayScore: UInt
    var isFinished: Bool
    var homeIsWinner: Bool {
        return homeScore > awayScore
    }
    var awayIsWinner: Bool {
        return !homeIsWinner
    }
}

struct PlayerView : View {
    let user: UserViewModel
    let textAlignment: HorizontalAlignment

    var body: some View {
        VStack(alignment: textAlignment) {
            Image(uiImage: user.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(user.name)
                    .font(.system(.title, design: .rounded))
            Text(String(user.rating))
                .font(.system(.headline, design: .rounded))
                .color(.ratingColor(user.rating))
        }
    }
}

struct ScoreView : View {
    let homeScore: UInt
    let awayScore: UInt
    let isFinished: Bool

    var body: some View {
        ZStack {
            HStack {
                HStack {
                    Spacer()
                    Text(String(homeScore))
                        .font(.system(size: 72))
                        .color(isFinished ? (homeScore > awayScore ? .green : .red) : .black)
                }
                Spacer()
                HStack {
                    Text(String(awayScore))
                        .font(.system(size: 72))
                        .color(isFinished ? (awayScore > homeScore ? .green : .red) : .black)
                    Spacer()
                }
            }
            Text(":")
                .font(.system(size: 72))
        }
    }
}

struct GameView : View {
    let gameService: GameService = GameServiceImpl()
    let userService: UserService = UserServiceImpl()

    @State var game: GameViewModel!
    var awayUser: UserViewModel?

    var body: some View {
        VStack {
            if game != nil {
                HStack {
                    PlayerView(user: game.homeUser, textAlignment: .leading).padding(.leading, 24)
                    Spacer()
                    Divider()
                    Spacer()
                    PlayerView(user: game.awayUser, textAlignment: .trailing).padding(.trailing, 24)
                }.navigationBarTitle("Матч")
                Divider()
                ScoreView(homeScore: game.homeScore, awayScore: game.awayScore, isFinished: game.isFinished)
                Divider()
                if game.isFinished {
                    VStack {
                        Text("Победитель")
                            .font(.system(.largeTitle, design: .rounded))
                        PlayerView(user: game.homeIsWinner ? game.homeUser : game.awayUser, textAlignment: .center)
                    }
                } else {
                    HStack {
                        Button(action: {
                            self.addScore(to: true)
                        }) {
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                                .foregroundColor(.green)
                        }.padding(16)
                        Divider()
                        Button(action: {
                            self.addScore(to: false)
                        }) {
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                                .foregroundColor(.blue)
                        }.padding(16)
                    }
                }
                Spacer()
            }
        }.onAppear {
            self.viewAppeared()
        }
    }

    func viewAppeared() {
        guard let awayUser = awayUser else {
            return
        }

        userService.getCurrentUser { result in
            switch result {
            case .success(let homeUser):
                let game = GameViewModel(
                    homeUser: homeUser,
                    awayUser: awayUser,
                    homeScore: 0,
                    awayScore: 0,
                    isFinished: false
                )
                self.gameService.create(game) { result in
                    switch result {
                    case .success(let game):
                        self.game = game
                    case .failure:
                        break
                    }
                }
            case .failure:
                break
            }
        }
    }
    
    func addScore(to isHome: Bool) {
        if isHome {
            game.homeScore += 1
        } else {
            game.awayScore += 1
        }
        endGameIfNeeded()
        gameService.updateGame(game) { _ in }
    }

    func endGameIfNeeded() {
        if game.homeScore >= 11 && game.homeScore > game.awayScore && game.homeScore - game.awayScore >= 2 {
            game.isFinished = true
        }
        if game.awayScore >= 11 && game.awayScore > game.homeScore && game.awayScore - game.homeScore >= 2 {
            game.isFinished = true
        }
    }
}

#if DEBUG
struct GameView_Previews : PreviewProvider {
    static var previews: some View {
        let homeUser = UserViewModel(name: "Home", rating: 400, image: UIImage(named: "defaultImage")!, lastGames: [])
        let awayUser = UserViewModel(name: "Away", rating: 600, image: UIImage(named: "defaultImage")!, lastGames: [])
        return GameView(game: GameViewModel(homeUser: homeUser, awayUser: awayUser, homeScore: 7, awayScore: 11, isFinished: true))
    }
}
#endif
