//
//  UserProfileContract.swift
//  ApepsKPI
//
//  Created by Игорь on 20.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import UIKit

protocol UserProfileView: class {
    var presenter: UserProfilePresentation! { get set }
    func showWrongInfoAllert()
}

protocol UserProfilePresentation: class {
    weak var view: UserProfileView? { get set }
    var interactor: UserProfileUseCase! { get set }
    var router: UserProfileWireframe! { get set }
    
    func viewDidLoad()
    func didClickSaveButton(withUser user:UserEntity)
}

protocol UserProfileUseCase: class {
    weak var output: UserProfileInteractorOutput! { get set }
    func saveNewUserInfo(user: UserEntity)
}

protocol UserProfileInteractorOutput: class {
    func userInfoUpdated(user: UserEntity)
    func userInfoUpdateFailed(error: String)
}

protocol UserProfileWireframe: class {
    weak var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}
