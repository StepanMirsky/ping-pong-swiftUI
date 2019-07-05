//
//  ProfileView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct ProfileView : View {
//    let userDefaults = UserDefaults.standard
    
    let userService: UserService = UserServiceImpl()
    
    @State var user: UserViewModel!
    @State var showingAlert: Bool = false
    @State var errorMessage: String = ""
    
    var isMe: Bool
    
    @State var isAuthorized: Bool = UserDefaults.standard.string(forKey: "cookie") != nil
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                if (isAuthorized || !isMe) && user != nil {
                    if isMe {
                        PresentationLink(destination: RegistrationView()) {
                            Image(uiImage: user.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 300)
                                .clipShape(Circle())
                        }
                    } else {
                        Image(uiImage: user.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
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
                } else  {
                    PresentationLink(destination: LoginView()) {
                        Text("Войти или зарегистрироваться")
                            .font(.system(.headline, design: .rounded))
                    }
                }
            }
            .onAppear {
                self.userService.getCurrentUser { (result) in
                    switch result {
                    case .success(let user):
                        self.user = user
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                        self.showingAlert = true
                    }
                }
            }
        }
    }
}
