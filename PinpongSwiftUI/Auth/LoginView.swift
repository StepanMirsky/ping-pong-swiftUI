//
//  ContentView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct LoginView : View {
    @State var login: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Text("Введите логин")
                .navigationBarTitle("Войдите")
            TextField("", text: $login)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 16)
            Text("Введите пароль")
            SecureField("", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal,16)
            HStack {
                Button("Войти") {
                    self.signin()
                }.padding(16)
                NavigationLink(destination: RegistrationView()) {
                    Text("Зарегистрироваться")
                        .color(.blue)
                }.padding(16)
            }
        }
    }

    func signin() {
        print("Логин: \(login), Пароль: \(password)")
    }
}

#if DEBUG
struct Login_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
