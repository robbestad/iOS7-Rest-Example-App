//
//  RestTests.m
//  RestTests
//
//  Created by Sven Anders Robbestad on 23.01.14.
//  Copyright (c) 2014 Sven Anders Robbestad. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../Rest/ViewController.h"

#define weburl @"http://api.svenardo.com/games?callback=JSON_CALLBACK"

@interface RestTests : XCTestCase
@end

@implementation RestTests



 - (void)setUp
 {
 [super setUp];
 // Put setup code here. This method is called before the invocation of each test method in the class.
 }
 
 
 - (void)testCanFetchRestData
 {

     NSString *newString =@"FIRST CELL";
     NSMutableArray *newsDataForTable = [[NSMutableArray alloc] initWithCapacity:1];
     UITableView *newsTable = [[UITableView alloc] init];

     [newsDataForTable addObject:newString];
     [newsTable numberOfRowsInSection:[newsDataForTable count]];
     [newsTable reloadRowsAtIndexPaths:0 withRowAnimation:UITableViewRowAnimationLeft];

     int count=[newsDataForTable count];
     XCTAssertTrue(count == 1);
 }
 
 - (void)tearDown
 {
 
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 [super tearDown];
 }


@end
