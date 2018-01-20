//
//  UserEntity.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import ObjectMapper
class UserEntity: Mappable {
    var name:String?
    var surname:String?
    var role:UserRole?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name      <- map["name"]
        surname   <- map["surname"]
    }
}
