//
//  UserService.swift
//  PinpongSwiftUI
//
//  Created by Aleksandr Anosov on 04.07.2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation
import Moya

enum APIError: Error {
    case textualError(String)
}

struct ErrorModel: Decodable {
    let errors: Errors
}

struct Errors: Decodable {
    let detail: String
}

typealias ResultClosure<T> = (Result<T, APIError>) -> ()

protocol UserService {
    func getUsers(_ result: @escaping ResultClosure<[UserViewModel]>)

    func getCurrentUser(_ result: @escaping ResultClosure<UserViewModel>)
}

class UserServiceImpl: UserService {
    let storage = Storage.shared
    let userDefaults = UserDefaults.standard

    func getUsers(_ result: @escaping ResultClosure<[UserViewModel]>) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            result(.success(self.storage.users))
        }
    }

    func getCurrentUser(_ result: @escaping ResultClosure<UserViewModel>) {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.myProfile) { requestResult in
            switch requestResult {
            case .success(let responce):
                print(String.init(data: responce.data, encoding: .utf8))
                
                if let someObj: DecodableObj? = try? FastDecoder.decode(responce.data) {
//                    result(.success(so))
                }
                if let error: ErrorModel? = try? FastDecoder.decode(responce.data) {
                    result(.failure(.textualError(error?.errors.detail ?? "")))
                }
                
            //do something
            case .failure(let error):
                result(.failure(.textualError(error.errorDescription ?? "")))
            }
        }
    }
}
