//
//  APIService.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import Moya_ObjectMapper
import ObjectMapper
import Moya
import RxSwift
import SwiftyJSON

enum Result<Value> {
    case Success(Value)
    case Failure(Error)
}

enum APIError: Error {
    case CannotParse(String)
    case UnsuccessfulSignup(String)
    case UnsuccessfulSignin(String)
    case BadStatusCode(String)
    case WrongInputParameters(String)
}

class APIService {
    
    private static var successfulStatusCodes = 200...226;
    
    func requestRx<T:Mappable>(url: String, method: HTTPMethod = .get,   parameters: [String: Any]? = nil,  encoding: ParameterEncoding = URLEncoding.default, headers:[String: String]? = nil) -> Observable<Result<T>> {
        return RxAlamofire.request(method, url, parameters: parameters,   encoding:  encoding,  headers: headers).flatMap({ response -> Observable<Any> in
            print("#requestRx #method:\(method) #url: \(String(describing: response.request?.url))")
            return response.validate({ (req, res, data) -> Request.ValidationResult in
                //                if (res.statusCode == 401 || res.statusCode == 403) {
                //                    print("auth error 401 403")
                //                    DefaultWireframe.presentAuthController()
                //                }
                return .success;
            }).validate(statusCode: APIService.successfulStatusCodes).rx.json()
        }).map(JSON.init).flatMap { json -> Observable<Result<T>> in
            guard let objects = Mapper<T>().map(JSONString: json.rawString() ?? "" ) else {
                
                return Observable.just(Result.Failure(APIError.CannotParse("Cannot parse json")))
            }
            return Observable.just(Result.Success(objects))
            }.catchError({ (err) -> Observable<Result<T>> in
                return Observable.just(Result.Failure(APIError.BadStatusCode(err.localizedDescription)));
            })
    }
}

















