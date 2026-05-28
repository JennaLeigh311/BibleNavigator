//
//  BibleNavigatorViewController.swift
//  BibleNavigator
//
//  Created by Jenna Bunescu on 5/28/26.
//

import UIKit

class BibleNavigatorViewController: UINavigationController {


    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(BookViewController(), animated: true)

    }
}
