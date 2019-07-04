//
//  ProfileView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct User {
    let name: String
    let rating: Int
    let image: UIImage
}

struct ProfileView : View {
    var user: User = User(name: "Sergey", rating: 1000, image: UIImage(named: "defaultImage")!)
    var isMe: Bool
    var homeUser: User {
        return User(name: "Это я", rating: 1000, image: UIImage(named: "defaultImage")!)
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                if isMe {
                    PresentationLink(destination: RegistrationView()) {
                        Image(uiImage: user.image)
                            .frame(width: 300, height: 300)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                    }
                } else {
                    Image(uiImage: user.image)
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                }
                Text(user.name)
                    .font(Font.system(.largeTitle, design: .rounded))
                Text("\(user.rating)")
                    .color(Color.ratingColor(user.rating))
                    .font(Font.system(.title, design: .rounded))
                if !isMe {
                    NavigationLink(destination: GameView(game: Game(homeUser: homeUser, awayUser: user, homeScore: 0, awayScore: 0, isFinished: false))) {
                        Text("Вызвать")
                            .font(.system(.headline, design: .rounded))
                    }
                }
                Spacer()
                NavigationLink(destination: GamesView(userId: user.name) ) {
                    Text("Посмотреть все игры")
                }
            }
        }
    }
}
