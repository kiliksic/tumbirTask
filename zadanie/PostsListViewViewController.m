//
//  PostsListViewViewController.m
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import "PostsListViewViewController.h"
#import "SearchBarView.h"

@interface PostsListViewViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) SearchBarView *searchBar;
@property (strong, nonatomic) UITableView *tableView;


@end

@implementation PostsListViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SEARCH POSTS";
    _searchBar = [[SearchBarView alloc] init];
    
    [self.view addSubview:_searchBar];
    
    // init table view
    _tableView = [[UITableView alloc] init];
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
//    _tableView.backgroundColor = [UIColor cyanColor];
    
    // add to canvas
    [self.view addSubview:_tableView];
    
    [self setupView];

    
}

- (void)setupView {
    [_searchBar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(50);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.width.equalTo(self.view.width);
        make.bottom.equalTo(self.tableView.top);
        
        make.height.mas_equalTo(80);
        
    }];
    
    [_searchBar setBackgroundColor:[UIColor redColor]];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.bottom);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.width.equalTo(self.view.width);
        make.bottom.equalTo(self.view.bottom);
        
        
    }];
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellIdentifier = @"HistoryCell";
//    
//    // Similar to UITableViewCell, but
//    JSCustomCell *cell = (JSCustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        cell = [[JSCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    // Just want to test, so I hardcode the data
//    cell.descriptionLabel.text = @"Testing";
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %d row", indexPath.row);
}


@end
