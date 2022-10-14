//
//  SceneDelegate.swift
//  RealmApp
//
//  Created by iFARA💻 on 13.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        window?.rootViewController = MainViewController(viewModel: TableViewViewModel())
        window?.makeKeyAndVisible()
    }
}

