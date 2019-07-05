//
//  ProfileView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct ProfileView : View {
    let userDefaults = UserDefaults.standard

    var user: UserViewModel = UserViewModel(
        name: "Sergey",
        rating: 1000,
        image: UIImage(named: "defaultImage")!,
        lastGames: [
            ShortGame(isWin: false),
            ShortGame(isWin: true)
        ]
    )

    var isMe: Bool

    var isAuthorized: Bool {
        return userDefaults.string(forKey: "token") != nil
    }

    var body: some View {
        ScrollView {
            
            VStack(alignment: .center, spacing: 20) {
                if isAuthorized || !isMe {
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
                        .font(Font.system(.headline, design: .rounded))
                    LastGamesView(lastGames: user.lastGames)
                    if !isMe && isAuthorized {
                        NavigationLink(destination: GameView(game: nil, awayUser: self.user)) {
                            Text("Вызвать")
                                .font(.system(.headline, design: .rounded))
                        }
                    }
                    Spacer()
                    NavigationLink(destination: GamesView(userName: user.name)) {
                        Text("Посмотреть все игры")
                            .font(.system(.headline, design: .rounded))
                    }
                } else {
                    PresentationLink(destination: LoginView()) {
                        Text("Войти или зарегистрироваться")
                            .font(.system(.headline, design: .rounded))
                    }
                }
            }
        }
    }
}
