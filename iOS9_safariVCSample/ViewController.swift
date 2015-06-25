//
//  ViewController.swift
//  iOS9_safariVCSample
//
//  Created by Kentaro Matsumae on 2015/06/18.
//  Copyright © 2015年 Kentaro Matsumae. All rights reserved.
//

import UIKit
import SafariServices

let kSafariViewControllerCloseNotificationName = "safariViewControllerCloseNotificationName"

class ViewController: UIViewController {
    
    lazy var safariVC:SFSafariViewController! = {
        let url = NSURL(string: "http://kenmaz.net/tmp/ios9_sample.html")!
        let vc = SFSafariViewController(URL:url)
        vc.delegate = self
        return vc
    }()
    
    var tracked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserverForName(
            kSafariViewControllerCloseNotificationName,
            object: nil,
            queue: NSOperationQueue.mainQueue()) { [unowned self] (notification) -> Void in
                
                self.tracked = true
                self.safariVC.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !tracked {
            presentViewController(safariVC, animated: true, completion: nil)
        }
    }
}

extension ViewController: SFSafariViewControllerDelegate {

    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}


