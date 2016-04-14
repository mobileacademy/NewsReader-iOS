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
        return "192.168.13.19/newsreaderpush/public/add_token/\(token)"
    }
    
    static func sendPushEndpoint(mess:String)->String{
        return "192.168.13.19/newsreaderpush/public/send_notification/\(mess)"
    }
}