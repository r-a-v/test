//
//  SceneDelegate.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController(rootViewController: ListViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

