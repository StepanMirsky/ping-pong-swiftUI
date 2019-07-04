//
//  RatingsView.swift
//  PinpongSwiftUI
//
//  Created by Vitaliy Lushnev on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct Rating: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let value: Int
    let image: UIImage
}

struct RatingsList: View {
    var ratings: [Rating]
    
    var body: some View {
        List(ratings) { rating in
            NavigationLink(destination: ProfileView(user: User(name: rating.name, rating: rating.value, image: rating.image), isMe: false)) {
                RatingRow(rating: rating)
            }
        }.listStyle(.grouped)
    }
}

struct RatingsView : View {
    var ratings = [Rating(name: "Серега", value: 500, image: UIImage(named: "defaultImage")!),
                   Rating(name: "Федя", value: 600, image: UIImage(named: "defaultImage")!)]
    
    var body: some View {
        RatingsList(ratings: ratings)
    }
}
