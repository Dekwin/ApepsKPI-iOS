//
//  AuthorizationContract.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import UIKit

protocol AuthorizationView: class {
    var presenter: AuthorizationPresentation! { get set }
    func showWrongCredentialsAllert()
}

protocol AuthorizationPresentation: class {
    weak var view: AuthorizationView? { get set }
    var interactor: AuthorizationUseCase! { get set }
    var router: AuthorizationWireframe! { get set }
    
    func viewDidLoad()
    func didClickLoginButton()
    func didSet(role:UserRole)
}

protocol AuthorizationUseCase: class {
    weak var output: AuthorizationInteractorOutput! { get set }
    func signInWith(credentials: UserCredentialsEntity)
}

protocol AuthorizationInteractorOutput: class {
    func userSignedIn(user: UserEntity)
    func userSignInFailed(error: String)
}

protocol AuthorizationWireframe: class {
    weak var viewController: UIViewController? { get set }
    func presentMain(forUser user: UserEntity)
    func presentAlertSignInFailed(error: String)
    static func assembleModule() -> UIViewController
}
