//
//  StoryCollection.m
//  NewsReader
//
//  Created by Mac on 12/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import "StoryCollection.h"

@interface StoryCollection ()

@property (nonatomic) NSMutableArray<StoryModel*>* stories;

@end

@implementation StoryCollection

- (instancetype) init{
    self = [super init];
    
    if(self){
        self.stories = [NSMutableArray new];
    }

    return self;
}

- (void)addStory:(StoryModel *)newStory{
    [self.stories addObject:newStory];
}

- (NSArray<StoryModel*>*)topStories{
    NSUInteger length = 10;
    
    if( self.stories.count < 10 ){
        length = self.stories.count;
    }
    
    NSArray<StoryModel*>* ret = [self.stories subarrayWithRange:NSMakeRange(0, length)];
    
    return ret;
}

@end
