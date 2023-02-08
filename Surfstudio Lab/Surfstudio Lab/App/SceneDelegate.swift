//
//  SceneDelegate.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = RequestViewController()
        window?.makeKeyAndVisible()
    }
}

