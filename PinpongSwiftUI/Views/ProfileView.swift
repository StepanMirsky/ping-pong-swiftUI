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
    var user: User = User.init(name: "Sergey", rating: 1000, image: UIImage(named: "defaultImage")!)
    var isMe: Bool
    
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
                    .font(Font.system(size: 25, design: .rounded))
                Text("\(user.rating)")
                    .color((user.rating > 1000) ? .green : (user.rating < 500 ? .red : .gray))
                    .font(Font.system(size: 25, design: .rounded))
            }
        }
    }
}
