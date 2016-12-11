//
//  zadanieTests.m
//  zadanieTests
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SearchBarView.h"
#import "PostsListViewViewController.h"
#import "DetailPostViewController.h"
#import "APIManager.h"

@interface zadanieTests : XCTestCase

@property (nonatomic) APIManager *apiManagerToTest;
@property (nonatomic) PostsListViewViewController *postsVCTest;
@property (nonatomic) DetailPostViewController *detailPostVCTest;

@end

@implementation zadanieTests

- (void)setUp {
    [super setUp];
    self.apiManagerToTest = [[APIManager alloc] init];
    self.postsVCTest = [[PostsListViewViewController alloc] init];
    self.detailPostVCTest = [[DetailPostViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPostsListVC {
    XCTAssertNotNil(_postsVCTest, @"Cannot find posts list view controller instance");
}

- (void)testPostDetailVC {
    XCTAssertNotNil(_detailPostVCTest, @"Cannot find detail post view controller instance");
}

- (void)testSearchBar {
    UIApplication *app = [UIApplication sharedApplication];
    UIView * searchView = (SearchBarView*)[app delegate];
    XCTAssertNotNil(searchView, @"Cannot find searchBar instance");
}

- (void)testRequestUrl {
    NSString * requestPattern = @"http://.tumblr.com/api/read?type=photo";
    NSString * requestUrl = self.apiManagerToTest.url;
    
    XCTAssertNotEqual(requestPattern, requestUrl, @"Username has not been append to the request");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
