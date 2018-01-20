//
//  UserProfileRouter.swift
//  ApepsKPI
//
//  Created by Игорь on 20.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import UIKit
class UserProfileRouter: UserProfileWireframe {
    var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = Constants.getFromMainStoryboardVCWith(identifier: "UserProfileVC") as! UserProfileViewController
        let presenter = UserProfilePresenter()
        let interactor =  UserProfileInteractor()
        let router =  UserProfileRouter()
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigation
    }
}
