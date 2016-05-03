//
//  LightboxTransition.swift
//  Lightbox Transition Demo
//
//  Created by Corwin Crownover on 3/7/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {
    
    var blackView: UIView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        // Create darkened screen behind toVC
        blackView = UIView()
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        blackView.frame = fromViewController.view.frame
        blackView.alpha = 0
        
        // add blackView to view hierarchy
        fromViewController.view.addSubview(blackView)
        
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0)
        
        // I want to disable interaction with fromVC 
        fromViewController.view.userInteractionEnabled = false
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8)
            
            // blackView alpha of 1 will still effectively have 0.8 alpha b/c background alpha above already defined as 0.8
//            self.blackView.alpha = 1
            
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        // dismiss blackView
        blackView.removeFromSuperview()
        
        fromViewController.view.alpha = 1
        
        // reactivate user interation
        toViewController.view.userInteractionEnabled = true
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.transform = CGAffineTransformMakeScale(0.001, 0.001)
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }

}
