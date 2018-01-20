//
//  AuthorizationRouter.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import UIKit
class AuthorizationRouter: AuthorizationWireframe {
    var viewController: UIViewController?
    
    func presentMain(forUser user: UserEntity) {
        viewController?.present(MainTabBarRouter.assembleModule(forRole: user.role!), animated: false, completion: nil) 
    }
    
    func presentAlertSignInFailed(error: String) {
        
    }
    
    static func assembleModule() -> UIViewController {
        let view = Constants.getFromMainStoryboardVCWith(identifier: "AuthorizationVC") as? AuthorizationViewController
        let presenter = AuthorizationPresenter()
        let interactor = AuthorizationInteractor()
        let router = AuthorizationRouter()
        let navigation = view!//UINavigationController(rootViewController: view!)
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigation
    }
    

}
