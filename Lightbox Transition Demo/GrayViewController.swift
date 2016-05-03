//
//  GrayViewController.swift
//  Lightbox Transition Demo
//
//  Created by Corwin Crownover on 3/7/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class GrayViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var label: UILabel!
    
    var labelString: String!
    
    
    
    // VIEW DID LOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = labelString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    // FUNCTIONS
    @IBAction func onDismissButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
