//  SceneDelegate.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        /// 1. Capture the scene
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
        /// 2. Create a new UIWindow using the windowScene constructor which takes in a window scene.
        let window = UIWindow(windowScene: windowScene)
        guard let viewController = vcFactory().createVC() else {
            fatalError("Problem creating the main ViewController.")
        }

        /// 4. Display
        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

struct vcFactory {
    func createVC() -> UIViewController? {
        let presenter = Presenter(repository: LocalDataLayer())
        let vc = UIStoryboard(name: "View", bundle: nil).instantiateInitialViewController(creator: { coder in
            ViewController(coder: coder, presenter: presenter)
        })
        
        presenter.view = vc
        return vc
    }
}
