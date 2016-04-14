//
//  PushAPI.swift
//  NewsReader
//
//  Created by Mac on 14/04/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import Foundation

class PushAPI{
    static func addTokenEndpoint(token:String)->String{
        let urlEncoded = token.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        return "http://192.168.13.19/newsreaderpush/public/add_token/\(urlEncoded)"
    }
    
    static func sendPushEndpoint(mess:String)->String{
        let messEncoded = mess.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        return "http://192.168.13.19/newsreaderpush/public/send_notification/\(messEncoded)"
    }
}