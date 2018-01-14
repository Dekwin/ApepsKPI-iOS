//
//  AuthorizationPresenter.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationPresenter: AuthorizationPresentation {
    
    weak var view: AuthorizationView?
    var interactor: AuthorizationUseCase!
    var router: AuthorizationWireframe!
    
    func viewDidLoad() {
        
    }
    
    func didClickLoginButton(withCredentials credentials:UserCredentialsEntity) {
        
    }
    
    func didSet(role: UserRole) {
        
    }
    

}

extension AuthorizationPresenter: AuthorizationInteractorOutput {
    func userSignedIn(user: UserEntity) {
        
    }
    
    func userSignInFailed(error: String) {
        
    }
    
  
}
