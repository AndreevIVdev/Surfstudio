//
//  SceneDelegate.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .light
        let requestViewController: RequestViewController = .init()
        requestViewController.onActionButtonTap = { [weak requestViewController] in
            let alert = UIAlertController(
                title: .congratilations,
                message: .yourRequestWasSent,
                preferredStyle: .alert
            )
            alert.addAction(.init(title: .close, style: .default))
            alert.view.tintColor = .label
            requestViewController?.present(alert, animated: true)
        }
        window?.rootViewController = requestViewController
        window?.makeKeyAndVisible()
    }
}
