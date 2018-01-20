//
//  MainTabBarWireframe.swift
//  ApepsKPI
//
//  Created by Игорь on 20.01.2018.
//  Copyright © 2018 igor. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarRouter  {
    
    var controllers:[UIViewController]
    //var rootWireframe : RootWireframe?
    
  
    init(){
        self.controllers = [UIViewController]()
    }
    
    func initControllers(forRole role: UserRole) {
        switch role {
        case .student:
            controllers.append(UserProfileRouter.assembleModule())
            
        case .teacher:
            break
            
        }
    }
    
    static func assembleModule(forRole role: UserRole) -> UIViewController {
        let tabBarController = UITabBarController() //Constants.getFromMainStoryboardVCWith(identifier: "MainTabbarVC") as! UITabBarController
        let router = MainTabBarRouter()
        router.initControllers(forRole: role)
        tabBarController.viewControllers = router.controllers
       // tabBarController.navigationItem.title = "Visva"
        //tabBarController.tabBarItem.image
        return tabBarController
        //self.rootWireframe?.installTabBarControllerIntoWindow(tabBarController: tabBarController, window: window)
    }
    
}


