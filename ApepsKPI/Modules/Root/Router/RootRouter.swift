//
//  RootRouter.swift
//  ApepsKPI
//
//  Created by Игорь on 13.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import UIKit
class RootRouter: RootWireframe {

    func presentAuthorizationScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = AuthorizationRouter.assembleModule()
    }
}
