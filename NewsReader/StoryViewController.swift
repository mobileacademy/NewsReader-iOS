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
    
    private var isLoaded:Bool = false
    private var urlToLoad:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        isLoaded = true
        
        if urlToLoad != nil {
            goToUrl(urlToLoad!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToUrl(urlS:String){
        guard isLoaded == true else{
            urlToLoad = urlS
            return
        }
        
        guard let url = NSURL(string:urlS) else{
            return
        }
        
        let req = NSURLRequest(URL: url)
        
        //remove the comment and can also remove
        //isLoaded
        //urlToLoad
        //the first guard
        //logic from viewDidLoad
        //self.view = self.view
        
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
