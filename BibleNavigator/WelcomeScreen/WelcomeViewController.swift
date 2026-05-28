//
//  ViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func loadView() {
        view = WelcomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // call the loading of the API data here
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            Task {
                await self.switchToMainApp()
            }
        }
    }
    
    func loadData() {
        
    }

    func switchToMainApp() async {
        await animateOut()
        // So I learned that view.window will give us the window that the current view/viewcontroller belongs to
        // so we can switch it within this view controller rather than in the scene
        guard let windowScene = view.window?.windowScene,
              // scene delegate stores the reference to the window
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else {
            return
        }

        window.rootViewController = BibleNavigatorViewController()
        window.makeKeyAndVisible()
    }
    
    public func animateOut() async {
        await withCheckedContinuation { continuation in
            UIView.animate(
                withDuration: 1.0,
                animations: {
                    self.view.alpha = 0.0
                },
                completion: { _ in
                    self.view.isHidden = true
                    continuation.resume()
                }
            )
        }
    }

}

