//
//  ViewController.h
//  NewsReader
//
//  Created by Mac on 12/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryModel.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) NSArray<StoryModel*>* dataSource;

@end

