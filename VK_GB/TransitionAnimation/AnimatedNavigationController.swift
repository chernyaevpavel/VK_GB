//
//  LoginNavigationController.swift
//  VK_GB
//
//  Created by Павел Черняев on 19.05.2021.
//

import UIKit

class AnimatedNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return NavigationAnimator(isPresent: true)
        } else if operation == .pop {
            return NavigationAnimator(isPresent: false)
        } else {
            return nil
        }
    }
}
