//
//  GamesView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct HistoryRow: View {
    let game: Game
    var body: some View {
        ZStack {
            HStack() {
                GamesProfileView(user: game.homeUser, isHome: true)
                Spacer()
                GamesProfileView(user: game.awayUser, isHome: false)            }
            GamesScoreView(game: game)
        }
    }
}

struct GamesView : View {
    @State var arr = [
        Game(
            homeUser: User(name: "Саня", rating: 100, image: UIImage(named: "personOne")!, lastWins: []),
            awayUser: User(name: "СаняЯЯЯЯЯЯ", rating: 100, image: UIImage(named: "personTwo")!, lastWins: []),
            homeScore: 1,
            awayScore: 6,
            isFinished: true
        ),
        Game(
            homeUser: User(name: "Серега", rating: 100, image: UIImage(named: "personOne")!, lastWins: []),
            awayUser: User(name: "Саня", rating: 100, image: UIImage(named: "personTwo")!, lastWins: []),
            homeScore: 1,
            awayScore: 11,
            isFinished: true
        ),
        Game(
            homeUser: User(name: "Степан", rating: 100, image: UIImage(named: "personOne")!, lastWins: []),
            awayUser: User(name: "Виталий", rating: 100, image: UIImage(named: "personTwo")!, lastWins: []),
            homeScore: 11,
            awayScore: 9,
            isFinished: true
        )
    ]
    
    var body: some View {
        List {
            ForEach(arr) { game in
                HistoryRow(game: game)
            }
        }.listStyle(.grouped)
        
    }
}

struct GamesProfileView: View {
    let user: User
    let isHome: Bool
    var imageAligment: HorizontalAlignment {
        return isHome ? .leading : .trailing
    }
    
    var body: some View {
        VStack(alignment: imageAligment) {
            Image(uiImage: user.image)
                .resizable()
                .frame(width: 35, height: 35, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1))
                .shadow(radius: 10)
            Text("\(user.name)")
                .font(.headline)
        }
    }
}

struct GamesScoreView: View {
    let game: Game
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 10) {
                HStack {
                    Spacer()
                    Text("\(game.homeScore)")
                        .font(.headline)
                        .color(game.homeScoreColor)
                }
                
                HStack {
                    Text("\(game.awayScore)")
                        .font(.headline)
                        .color(game.awayScoreColor)
                    Spacer()
                }
            }
            Text(":")
                .font(.headline)
        }
    }
}

private extension Game {
    var homeScoreColor: Color {
        return homeIsWinner ? .green : .black
    }
    
    var awayScoreColor: Color {
        return awayIsWinner ? .green : .black
    }
}
