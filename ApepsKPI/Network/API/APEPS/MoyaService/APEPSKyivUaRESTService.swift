//
//  APEPSRESTProvider.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyJSON
import RxSwift

enum APEPSKyivUaRESTService {
    
    case signIn(withCredentials:UserCredentialsEntity)
    case showAccounts
}

extension APEPSKyivUaRESTService: TargetType {
    
    var baseURL: URL { return URL(string: "https://api.myservice.com")! }
    var path: String {
        switch self {
        case .signIn(_):
            return "/signin"
        case .showAccounts:
            return "/accounts"
        }
    }
    var method: Moya.Method {
        switch self {
        case .showAccounts:
            return .get
        case .signIn:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .showAccounts: // Send no parameters
            return .requestPlain
        case let .signIn(credentials):
            return .requestParameters(parameters: ["email": credentials.email, "password": credentials.password], encoding: JSONEncoding.default)
        }
    }
    var sampleData: Data {
        switch self {
        case .signIn(let credentials):
            return "{\"email\": \(credentials.email), \"password\": \"\(credentials.password)\"\"}".utf8Encoded
        case .showAccounts:
            // Provided you have a file named accounts.json in your bundle.
            guard let url = Bundle.main.url(forResource: "accounts", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

extension Response {
    func mapped<T: Mappable>() throws -> T?  {
        let filtered = try filterSuccessfulStatusCodes()
        let json  = try JSON(data: filtered.data)
        return Mapper<T>().map(JSONString: json.rawString() ?? "" )
    }
}
