//
//  APEPSRestApi.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Moya_ObjectMapper

class APEPSKyivUaRESTApiImpl: RestApi  {
    
    static let shared = APEPSKyivUaRESTApiImpl()
    
    private let provider = MoyaProvider<APEPSKyivUaRESTService>()
    
    func signIn(withCredentials credentials: UserCredentialsEntity) -> Observable<UserEntity> {
        return provider.rx.request(.signIn(withCredentials: credentials)).filterSuccessfulStatusCodes().mapObject(UserEntity.self).asObservable()
    }

    
}
