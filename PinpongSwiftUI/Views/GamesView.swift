//
//  GamesView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct GameHistory: Identifiable, Hashable {
    var id = UUID()
    
    var personOne: String
    var personTwo: String
    var personOneScore: String
    var personTwoScore: String
    var personOneImageUrl: String
    var personTwoImageUrl: String
    var personOneIsWinner: Bool {
        return personOneScore > personTwoScore
    }
    var personTwoIsWinner: Bool {
        return !personOneIsWinner
    }
    
}

struct HistoryRow: View {
    let game: Game
    var body: some View {
        ZStack {
            HStack() {
                GamesProfileView(user: game.homeUser)
                Spacer()
                GamesProfileView(user: game.awayUser)
                            Spacer()
            }
            GamesScoreView(game: game)
        }
    }
}

struct GamesView : View {
    @State var arr = [
        Game(
            homeUser: User(name: "Саня", rating: 100, image: UIImage(named: "personOne")!),
            awayUser: User(name: "Серега", rating: 100, image: UIImage(named: "personTwo")!),
            homeScore: 11,
            awayScore: 9
        ),
        Game(
            homeUser: User(name: "Серега", rating: 100, image: UIImage(named: "personOne")!),
            awayUser: User(name: "Саня", rating: 100, image: UIImage(named: "personTwo")!),
            homeScore: 1,
            awayScore: 11
        ),
        Game(
            homeUser: User(name: "Степан", rating: 100, image: UIImage(named: "personOne")!),
            awayUser: User(name: "Виталий", rating: 100, image: UIImage(named: "personTwo")!),
            homeScore: 11,
            awayScore: 9
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
    
    var body: some View {
        VStack(alignment: .center) {
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
