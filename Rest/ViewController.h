//
//  ViewController.h
//  Rest
//
//  Created by Sven Anders Robbestad on 23.01.14.
//  Copyright (c) 2014 Sven Anders Robbestad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{

    UITableView* newsTable;
    NSMutableArray *newsDataForTable;
}

@property (nonatomic, strong) IBOutlet UITableView* newsTable;
@property (nonatomic, retain) IBOutlet NSMutableArray *newsDataForTable;
@property (nonatomic, strong) IBOutlet UILabel *restId;
@property (nonatomic, strong) IBOutlet UILabel *restContent;


@end
