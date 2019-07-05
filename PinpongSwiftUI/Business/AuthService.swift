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

struct AuthResponse<T: Decodable>: Decodable {
    let data: T
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
            case .success(_):
                self.login(credentials, onResult: onResult)
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
                let object: AuthResponse<User> = FastDecoder.decode(response.data)
                self.userDefaults.set(object.data.id, forKey: "id")
                self.userDefaults.set(object.data.login, forKey: "login")
                onResult(.success(object.data.id))
            default:
                break
            }
        }
    }
}
