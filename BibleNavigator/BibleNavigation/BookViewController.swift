//
//  BookViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BookViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Task {
            await animateIn()
        }
        
        view.backgroundColor = .blue
        
        do {
            try chooseChapter()
            print("Success!")
        } catch {
            print("Failed: \(error.localizedDescription)")
        }
        
    }
    
    // Source - https://codemia.io/knowledge-hub/path/make_a_simple_fade_in_animation_in_swift
    func animateIn() async {
        await withCheckedContinuation { continuation in
            self.view.alpha = 0.0
            UIView.animate(
                withDuration: 0.7,
                animations: {
                    self.view.alpha = 1.0
                },
                completion: { _ in
                    continuation.resume()
                }
            )
        }
    }
    
    func chooseChapter() throws {
        guard let navigationViewController = view.window?.rootViewController as? UINavigationController else {
            throw NSError(domain: "AppError", code: 1, userInfo: [NSLocalizedDescriptionKey: "No navigation controller found"])
        }
        
        navigationViewController.pushViewController(ChapterViewController(), animated: true)
        
    }
}
