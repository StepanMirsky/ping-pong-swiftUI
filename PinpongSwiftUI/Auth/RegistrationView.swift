//
//  ContentView.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import SwiftUI

struct RegistrationView : View {
    let authService: AuthService = AuthServiceImpl()
    let userDefaults = UserDefaults.standard

    enum PasswordMatch {
        case equal
        case notEqual
        case notReady
    }

    @Environment(\.isPresented) var isPresented: Binding<Bool>?

    @State var login: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""

    var body: some View {
        VStack {
            Text("Введите логин: ")
                .font(.system(.subheadline, design: .rounded))
                .navigationBarTitle("Зарегистрируйтесь")
            TextField("", text: $login)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 16)
            Text("Введите пароль: ")
                .font(.system(.subheadline, design: .rounded))
            SecureField("", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 16)
            Text("Повторите пароль: ")
                .font(.system(.subheadline, design: .rounded))
            SecureField("", text: $passwordConfirm)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 16)
            if passwordsMatch == .notEqual {
                Text("Пароли не совпадают")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.red)
                    .padding(.horizontal, 16)
            }
            Button("Зарегистрироваться") {
                self.register()
            }
                .padding(16)
                .disabled(passwordsMatch != .equal)
                .font(.system(.headline, design: .rounded))
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
        let credentials = Credentials(login: login, password: password)
        authService.register(credentials) { result in
            switch result {
            case .success(let token):
                self.userDefaults.set(token, forKey: "token")
                self.isPresented?.value = false
            case .failure:
                break
            }
        }
    }
}

#if DEBUG
struct RegistrationView_Previews : PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
#endif
