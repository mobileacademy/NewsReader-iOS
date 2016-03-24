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

#import "NewsReader-Swift.h"

@interface ViewController (){
    
}

@end

@implementation ViewController

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self){
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* cellID = @"storyCellId";
    
    StoryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID
        forIndexPath:indexPath];
    
    cell.titleLabel.text = _dataSource[ indexPath.row ].title;
    
    cell.idLabel.text = _dataSource[ indexPath.row ].id;
    
    return cell;
}

- (void) setDataSource:(NSArray<StoryModel *> *)dataSource{
    _dataSource = dataSource;
    
    [self.storyTable reloadData];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if( [segue.identifier isEqualToString:@"go_to_show_story"] ){
        StoryViewController* dest = (StoryViewController*)segue.destinationViewController;
        
       
    }
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
