//
//  StoryViewController.swift
//  NewsReader
//
//  Created by Mac on 24/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goToUrl( "http://google.com" )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToUrl(urlS:String){
        guard let url = NSURL(string:urlS) else{
            return
        }
        
        let req = NSURLRequest(URL: url)
        
        webView.loadRequest(req)
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
