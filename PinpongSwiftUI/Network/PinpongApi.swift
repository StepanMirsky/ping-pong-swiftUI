//
//  PinpongApi.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 05/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

//Examples https://github.com/Moya/Moya/blob/master/docs/Examples/Basic.md
import Foundation
import Moya

enum PinpongRequest {
    case games
    case showUser(id: Int)
}

extension PinpongRequest: TargetType {
    var baseURL: URL {
        return URL(string: "https://young-wave-17813.herokuapp.com")!
        
    }
    
    var path: String {
        switch self {
        case .games:
            return "/games"
        case .showUser(let id):
            return "/users/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .games, .showUser:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .games, .showUser:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
