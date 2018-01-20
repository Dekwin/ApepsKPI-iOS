//
//  UserProfilePresenter.swift
//  ApepsKPI
//
//  Created by Игорь on 20.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
class UserProfilePresenter: UserProfilePresentation {
    var view: UserProfileView?
    
    var interactor: UserProfileUseCase!
    
    var router: UserProfileWireframe!
    
    func viewDidLoad() {
        
    }
    
    func didClickSaveButton(withUser user: UserEntity) {
        
    }
    
    
}

extension UserProfilePresenter: UserProfileInteractorOutput {
    func userInfoUpdated(user: UserEntity) {
        
    }
    
    func userInfoUpdateFailed(error: String) {
        
    }
}
