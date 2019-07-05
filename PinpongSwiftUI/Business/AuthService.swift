//
//  AuthService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Moya

struct Credentials {
    let login: String
    let password: String
}

protocol AuthService {
    func register(_ credentials: Credentials, result: @escaping ResultClosure<String>)

    func login(_ credentials: Credentials, result: @escaping ResultClosure<String>)
}

class AuthServiceImpl: AuthService {
    let storage = Storage.shared

    func register(_ credentials: Credentials, result: @escaping ResultClosure<String>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.createUser(credentials)) { result in
            switch result {
            case .success(let response):
                let someObj: DecodableObj = FastDecoder.decode(response.data)
            default:
                break
            }
        }
    }   

    func login(_ credentials: Credentials, result: @escaping ResultClosure<String>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.auth(credentials)) { result in
            switch result {
            case .success(let response):
                let someObj: DecodableObj = FastDecoder.decode(response.data)
            default:
                break
            }
        }
    }
}
