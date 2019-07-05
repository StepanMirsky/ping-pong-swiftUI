//
//  RatingsView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct ShortGame: Hashable {
    let id = UUID()
    let isWin: Bool
}

struct UserViewModel: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let rating: Int
    let image: UIImage
    let lastGames: [ShortGame]
    
    init(name: String, rating: Int, image: UIImage, lastGames: [ShortGame]) {
        self.name = name
        self.rating = rating
        self.image = image
        self.lastGames = lastGames
    }
    
    
    init(from user: User) {
        self.name = user.login
        self.rating = user.rating
        self.image = UIImage(named: "defaultImage")!
        self.lastGames = []
    }
}



struct RatingsList: View {
    var users: [UserViewModel]
    
    var body: some View {
        List(users) { user in
            NavigationLink(
                destination: ProfileView(user: user, isMe: false)) {
                RatingRow(user: user)
            }
        }.listStyle(.grouped)
    }
}

struct RatingsView : View {
    let userService: UserService = UserServiceImpl()

    @State var users: [UserViewModel] = []
    
    var body: some View {
        RatingsList(users: users)
            .onAppear {
                self.userService.getUsers { result in
                    switch result {
                    case .success(let users):
                        self.users = users
                    case .failure:
                        break
                    }
                }
        }
    }
}
