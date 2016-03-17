//
//  HackerNewsAPI.swift
//  NewsReader
//
//  Created by Mac on 17/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit

class HackerNewsAPI: NSObject {
    static let newStoryEndpoint = "https://hacker-news.firebaseio.com/v0/topstories.json"
    
    static let topStoryEndpoint = "https://hacker-news.firebaseio.com/v0/newstories.json"
    
    static func objectURL ( id:String ) -> String {
        return "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty"
    }
}
