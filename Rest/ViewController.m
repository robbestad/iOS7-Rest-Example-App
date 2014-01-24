//
//  ViewController.m
//  Rest
//
//  Created by Sven Anders Robbestad on 23.01.14.
//  Copyright (c) 2014 Sven Anders Robbestad. All rights reserved.
//

#import "ViewController.h"

#define weburl @"http://api.svenardo.com/games?callback=JSON_CALLBACK"
#define debug 1

@interface ViewController ()

@end

@implementation ViewController
@synthesize newsTable = _newsTable;
@synthesize newsDataForTable = _newsDataForTable;


- (IBAction)fetchRestData; {
    NSURL *url = [NSURL URLWithString:weburl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                   NSData *data, NSError *connectionError) {

                               if (data.length > 0 && connectionError == nil) {
                                   
                                   NSDictionary *rest_data = [NSJSONSerialization JSONObjectWithData:data
                                                                                             options:0
                                                                                               error:NULL];

                                   _newsDataForTable = [NSMutableArray array];
                                   NSDictionary *news;
                                   for (id key in rest_data[@"_embedded"]) {
                                       news = [rest_data[@"_embedded"] objectForKey:key];
                                   }


                                                                      int iterator = 0;
                                   for (id key in news) {
                                       [_newsDataForTable insertObject:key[@"title"] atIndex:iterator];
                                       iterator++;
                                   }

                                   [_newsTable reloadData];
                                   [_newsTable numberOfRowsInSection:[_newsDataForTable count]];
                                   [_newsTable reloadRowsAtIndexPaths:0 withRowAnimation:UITableViewRowAnimationLeft];
                               }

                           }];
    
 

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchRestData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - DATASOURCE: UITableView


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (debug == 1) {NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));}
    return [_newsDataForTable count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (debug == 1) {NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));}
    return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (debug == 1) {NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));}
    return false;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithRed:(200.0 / 255.0) green:(200.0 / 255.0) blue:(200. / 255.0) alpha:1];
    
    cell.selectedBackgroundView = selectionColor;
    [[cell textLabel] setTextColor:[UIColor colorWithRed:55.0 / 255.0 green:55.0 / 255.0 blue:55.0 / 255.0 alpha:1.0]];
    cell.textLabel.font = [UIFont fontWithName:@"Georgia" size:14];
    cell.backgroundColor = [UIColor clearColor];
    

    NSString* item = self.newsDataForTable[indexPath.row];
    cell.textLabel.text = item;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0;
}


- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 10);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 10);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 10);
}


@end
