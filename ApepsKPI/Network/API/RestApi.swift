//
//  APEPSRestApi.swift
//  ApepsKPI
//
//  Created by Игорь on 14.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import RxSwift

protocol RestApi: class {
    func signIn(withCredentials credentials: UserCredentialsEntity) -> Observable<UserEntity>
}
