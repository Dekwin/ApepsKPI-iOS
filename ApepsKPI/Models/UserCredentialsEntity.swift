//
//  UserCredentialsEntity.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import ObjectMapper
class UserCredentialsEntity:Mappable {
    var email:String?
    var password:String?
    
    init(email:String?, password:String?) {
        self.email = email
        self.password = password
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        email      <- map["email"]
        password <- map["password"]
    }
    
}
