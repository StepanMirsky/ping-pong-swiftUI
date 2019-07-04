//
//  SceneDelegate.swift
//  PinpongSwiftUI
//
//  Created by Лесников Александр Максимович on 04/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import UIKit
import SwiftUI
import Moya

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            let ratingsController = UIHostingController(rootView: RatingsView())
            let ratingsNavigationController = UINavigationController(rootViewController: ratingsController)
            ratingsNavigationController.navigationBar.prefersLargeTitles = true
            ratingsController.title = "Рейтинг"

            let gamesController = UIHostingController(rootView: GamesView())
            let gamesNavigationController = UINavigationController(rootViewController: gamesController)
            gamesNavigationController.navigationBar.prefersLargeTitles = true
            gamesController.title = "Игры"

            let profileController = UIHostingController(rootView: ProfileView(isMe: true))
            let profileNavigationController = UINavigationController(rootViewController: profileController)
            profileNavigationController.navigationBar.prefersLargeTitles = true
            profileController.title = "Профиль"

            let tabbarController = UITabBarController()
            
            tabbarController.setViewControllers(
                [ratingsNavigationController, gamesNavigationController, profileNavigationController],
                animated: false
            )
            tabbarController.tabBar.items?[0].image = UIImage(named: "combo_chart")
            tabbarController.tabBar.items?[1].image = UIImage(named: "game_controller")
            tabbarController.tabBar.items?[2].image = UIImage(named: "businessman")
            window.rootViewController = tabbarController
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

