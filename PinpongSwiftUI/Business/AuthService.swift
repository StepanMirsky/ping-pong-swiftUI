//
//  AuthService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation
import Moya

struct Credentials {
    let login: String
    let password: String
}

protocol AuthService {
    func register(_ credentials: Credentials, onResult: @escaping ResultClosure<Int>)

    func login(_ credentials: Credentials, onResult: @escaping ResultClosure<Int>)
}

class AuthServiceImpl: AuthService {
    let storage = Storage.shared
    let userDefaults = UserDefaults.standard
    
    func register(_ credentials: Credentials, onResult: @escaping ResultClosure<Int>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.createUser(credentials)) { result in
            switch result {
            case .success(let response):
                let user: User = FastDecoder.decode(response.data)
                self.userDefaults.set(user.id, forKey: "id")
                self.userDefaults.set(user.login, forKey: "login")
                self.saveAuthCookies()
                onResult(.success(user.id))
            default:
                break
            }
        }
    }   

    func login(_ credentials: Credentials, onResult: @escaping ResultClosure<Int>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.auth(credentials)) { result in
            switch result {
            case .success(let response):
                let user: User = FastDecoder.decode(response.data)
                self.userDefaults.set(user.id, forKey: "id")
                self.userDefaults.set(user.login, forKey: "login")
                self.saveAuthCookies()
                onResult(.success(user.id))
            default:
                break
            }
        }
    }
    
    private func saveAuthCookies() {
        guard let cookies = HTTPCookieStorage.shared.cookies else { return }
        
        let cookiesString = cookies.compactMap { "\($0.name)=\($0.value)"}
        userDefaults.set(cookiesString.joined(separator: ";"), forKey: "cookie")
    }
}
