//
//  HackerNewsComm.swift
//  NewsReader
//
//  Created by Mac on 17/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit
import SwiftyJSON

class HackerNewsComm {
    
    func fetchLatestStories(completionHandler:(StoryCollection)->Void){
        let url = NSURL( string:HackerNewsAPI.newStoryEndpoint )
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            let json = JSON(data: data!)
            
            let storyCollection:StoryCollection = StoryCollection()
            
            for (_,value) in json {
                let story:StoryModel = StoryModel()
                story.id = value.string
                
                storyCollection.addStory(story)
            }
            
            completionHandler( storyCollection )
        }
        
        task.resume()
        
    }
    
    func fetchTopStories(completionHandler:(StoryCollection)->Void){
        let url = NSURL( string:HackerNewsAPI.topStoryEndpoint )
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { data, response, error in
            
            let json = JSON(data: data!)
            
            let collection = StoryCollection()
            
            for (_,value) in json {
                let story = StoryModel()
                story.id = value.string
                
                collection.addStory(story)
            }
            
            completionHandler(collection)
        }
        
        task.resume()
    }
    
}
