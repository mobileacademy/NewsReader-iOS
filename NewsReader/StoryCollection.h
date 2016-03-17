//
//  StoryCollection.h
//  NewsReader
//
//  Created by Mac on 12/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoryModel.h"

@interface StoryCollection : NSObject

- (void)addStory:(StoryModel*)newStory;

- (NSArray<StoryModel*>*)topStories;

@end
