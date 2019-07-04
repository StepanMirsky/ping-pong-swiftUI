//
//  ContentView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct RegistrationView : View {
    enum PasswordMatch {
        case equal
        case notEqual
        case notReady
    }

    @State var login: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""

    var body: some View {
        VStack {
            Text("Войдите")
                .padding(16)
                .navigationBarTitle("Зарегистрируйтесь")
            Text("Введите логин: ")
            TextField("", text: $login)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 16)
            Text("Введите пароль: ")
            SecureField("", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal,16)
            Text("Повторите пароль: ")
            SecureField("", text: $passwordConfirm)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal,16)
            if passwordsMatch == .notEqual {
                Text("Пароли не совпадают")
                    .foregroundColor(.red)
                    .padding(.horizontal,16)
            }
            Button("Зарегистрироваться") {
                self.register()
            }
                .padding(16)
                .disabled(passwordsMatch != .equal)
        }
    }

    var passwordsMatch: PasswordMatch {
        guard !password.isEmpty, !passwordConfirm.isEmpty else {
            return .notReady
        }

        if password == passwordConfirm {
            return .equal
        }

        return .notEqual
    }

    func register() {
        print("Логин: \(login), Пароль: \(password)")
    }
}

#if DEBUG
struct RegistrationView_Previews : PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
#endif
