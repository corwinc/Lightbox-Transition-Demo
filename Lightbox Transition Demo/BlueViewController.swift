//
//  BlueViewController.swift
//  Lightbox Transition Demo
//
//  Created by Corwin Crownover on 3/7/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var textField: UITextField!
    
    var fadeTransition: FadeTransition!
    var lightboxTransition: LightboxTransition!

    
    
    // VIEW DID LOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        

        lightboxTransition = LightboxTransition()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // FUNCTIONS
    @IBAction func onPinch(sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        let velocity = sender.velocity
        
        print(scale)

        
        if sender.state == .Began {
            lightboxTransition.isInteractive = true
            performSegueWithIdentifier("graySegue", sender: nil)
        
        } else if sender.state == .Changed {
            // when the transition is interactive, it wants to know the % completion. divide by 8 to bring down to reasonable #... must translate to # btw. 0-1
            lightboxTransition.percentComplete = scale / 5
        
        } else if sender.state == .Ended {
            if velocity > 0 {
                lightboxTransition.finish()
            } else {
                lightboxTransition.cancel()
            }
            
            
            
        
        }
    }
    
    
    
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationViewController = segue.destinationViewController as! GrayViewController
        
        //destinationViewController hasn't performed viewDidLoad yet and label is nil, so must force destinationVC to perform viewDidLoad
//        destinationViewController.view.layoutIfNeeded()

        
        // send current textField.text to destinationVC's label
        destinationViewController.labelString = textField.text
        
        // don't do boring transition, do cool transition
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // what transition? this one...
        destinationViewController.transitioningDelegate = lightboxTransition
        
        print("I'm about to transition")
        
    }

}
