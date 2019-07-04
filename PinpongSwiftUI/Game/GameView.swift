//
//  ContentView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

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
    let homeScore: Int
    let awayScore: Int

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
    let homeUser: User
    let awayUser: User
    @State var homeScore: Int = 0
    @State var awayScore: Int = 0

    var body: some View {
        VStack {
            HStack {
                PlayerView(user: homeUser, textAlignment: .leading).padding(.leading, 24)
                Spacer()
                Divider()
                Spacer()
                PlayerView(user: awayUser, textAlignment: .trailing).padding(.trailing, 24)
            }
            Divider()
            ScoreView(homeScore: homeScore, awayScore: awayScore)
            Divider()
            HStack {
                Button(action: {
                    self.homeScore += 1
                }) {
                    Image("defaultImage")
                        .frame(width: 150, height: 150)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                }.padding(16)
                Divider()
                Button(action: {
                    self.awayScore += 1
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
        GameView(homeUser: User(name: "Home", rating: 400, image: UIImage(named: "defaultImage")!), awayUser: User(name: "Away", rating: 600, image: UIImage(named: "defaultImage")!))
    }
}
#endif
