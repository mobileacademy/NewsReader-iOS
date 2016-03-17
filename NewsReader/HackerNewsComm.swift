//
//  HackerNewsComm.swift
//  NewsReader
//
//  Created by Mac on 17/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit

class HackerNewsComm {
    
    func fetchLatestStories(){
        let url = NSURL( string:HackerNewsAPI.newStoryEndpoint )
        
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
        }
        
    }
    
    func fetchTopStories(){
        
    }
    
}
