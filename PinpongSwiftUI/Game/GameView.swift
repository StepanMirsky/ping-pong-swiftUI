//
//  ContentView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct Game: Identifiable {
    let id = UUID()
    let homeUser: User
    let awayUser: User
    var homeScore: UInt
    var awayScore: UInt
    var homeIsWinner: Bool {
        return homeScore > awayScore
    }
    var awayIsWinner: Bool {
        return !homeIsWinner
    }
}

struct PlayerView : View {
    let user: User
    let textAlignment: HorizontalAlignment

    var body: some View {
        VStack(alignment: textAlignment) {
            Image("defaultImage")
                .frame(width: 125, height: 125)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            Text(user.name).font(.system(size: 24))
            Text(String(user.rating))
        }
    }
}

struct ScoreView : View {
    let homeScore: UInt
    let awayScore: UInt

    var body: some View {
        ZStack {
            HStack {
                HStack {
                    Spacer()
                    Text(String(homeScore))
                        .font(.system(size: 72))
                }
                Spacer()
                HStack {
                    Text(String(awayScore))
                        .font(.system(size: 72))
                    Spacer()
                }
            }
            Text(":")
                .font(.system(size: 72))
        }
    }
}

struct GameView : View {
    @State var game: Game

    var body: some View {
        VStack {
            HStack {
                PlayerView(user: game.homeUser, textAlignment: .leading).padding(.leading, 24)
                Spacer()
                Divider()
                Spacer()
                PlayerView(user: game.awayUser, textAlignment: .trailing).padding(.trailing, 24)
            }
            Divider()
            ScoreView(homeScore: game.homeScore, awayScore: game.awayScore)
            Divider()
            HStack {
                Button(action: {
                    self.game.homeScore += 1
                }) {
                    Image("defaultImage")
                        .frame(width: 150, height: 150)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                }.padding(16)
                Divider()
                Button(action: {
                    self.game.awayScore += 1
                }) {
                    Image("defaultImage")
                        .frame(width: 150, height: 150)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                }.padding(16)
            }
            Spacer()
        }
    }
}

#if DEBUG
struct GameView_Previews : PreviewProvider {
    static var previews: some View {
        let homeUser = User(name: "Home", rating: 400, image: UIImage(named: "defaultImage")!)
        let awayUser = User(name: "Away", rating: 600, image: UIImage(named: "defaultImage")!)
        return GameView(game: Game(homeUser: homeUser, awayUser: awayUser, homeScore: 7, awayScore: 11))
    }
}
#endif
