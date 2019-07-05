//
//  ExampleRequest.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 05/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation
import Moya

// MARK: - Example request
struct ExampleRequest {
    func test() {
        let provider = MoyaProvider<PinpongRequest>()
        provider.request(.getUser(id: 5)) { result in
            switch result {
            case .success(let responce):
                let someObj: PinpongResponse<DecodableObj> = FastDecoder.decode(responce.data)
            //do something
            default:
                break
            }
        }
    }
}

struct DecodableObj: Decodable {
    
}
