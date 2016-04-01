//
//  HackerNewsViewController.swift
//  NewsReader
//
//  Created by Mac on 18/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit

class HackerNewsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().boolForKey(SettingsKey.BG.rawValue) {
            let imageView = UIImageView.init(image: UIImage(named:"bg1.jpg"))
            imageView.contentMode = .ScaleAspectFill
            
            tableView.backgroundView = imageView
        }
        else {
            tableView.backgroundView = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let comm = HackerNewsComm()
        
        switch segue.identifier!
        {
        case "go_to_latest":
            comm.fetchLatestStories{ collection in
                print( "got latest stories" )
                
                let topStories = collection.topStories()
                
                var i = 0
                
                for story in topStories {
                    comm.populateStory(story){ story in
                        i++
                        
                        if i >= 10 {
                            (segue.destinationViewController as! ViewController).dataSource = topStories
                        }
                    }
                }
            }
            break
        case "go_to_top":
            comm.fetchTopStories{ collection in
                print( "got top stories" )
                
                let topStories = collection.topStories()
                
                var i = 0
                
                for story in topStories {
                    comm.populateStory(story){ story in
                        i++
                        
                        if i >= 10 {
                            (segue.destinationViewController as! ViewController).dataSource = topStories
                        }
                    }
                }

            }
            break
        default:
            break
        }
    }

}
