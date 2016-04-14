//
//  PushComm.swift
//  NewsReader
//
//  Created by Mac on 14/04/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

class PushComm: NSObject {
    
    func addToken( token:String ){
        let url = NSURL( string:PushAPI.addTokenEndpoint(token) )!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){
            (data, response, err ) in
            print(response)
        }
        
        task.resume()
    }
    
    func sendMessage( mess:String ){
        let url = NSURL( string:PushAPI.sendPushEndpoint(mess) )!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){
            (data, response, err) in
            print(response)
        }
        
        task.resume()
    }

}
