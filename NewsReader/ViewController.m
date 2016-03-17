//
//  ViewController.m
//  NewsReader
//
//  Created by Mac on 12/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import "ViewController.h"
#import "StoryCollection.h"
#import "StoryTableViewCell.h"

@interface ViewController (){
    StoryCollection* _dataSource;
}

@end

@implementation ViewController

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        _dataSource = [StoryCollection new];
        
        StoryModel* model;
        
        for( int i = 0; i<10; i++){
            model = [StoryModel new];
            
            model.title = [NSString stringWithFormat:@"title %d", i];
            model.id = [NSString stringWithFormat:@"id %d", i];
            model.url = [NSString stringWithFormat:@"http://myapi.com/story?id=%d", i];
        
            [_dataSource addStory:model];
        }
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.topStories.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* cellID = @"storyCellId";
    
    StoryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID
        forIndexPath:indexPath];
    
    cell.titleLabel.text = _dataSource.topStories[ indexPath.row ].title;
    
    cell.idLabel.text = _dataSource.topStories[ indexPath.row ].id;
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
