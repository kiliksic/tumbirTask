//
//  PostsListViewViewController.m
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import "PostsListViewViewController.h"
#import "SearchBarView.h"
#import "APIManager.h"
#import "Post.h"
#import "DetailPostViewController.h"

@interface PostsListViewViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) SearchBarView *searchBar;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<Post *> *postsArray;

@end

@implementation PostsListViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SEARCH POSTS";
    [self setupView];
}

- (void)setupView {
    //SearchBar initialization
    _searchBar = [[SearchBarView alloc] init];
    
    //Tableview initialization
    _tableView = [[UITableView alloc] init];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self showResults:false];
    
    //Set searchbar delegate, tableview delegate and datasource
    _searchBar.delegate = self;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_searchBar];
    [self.view addSubview:_tableView];
    
    //Set constraints for searchbar and tableView
    int searchBarHeight = 50;
    
    [_searchBar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.width.equalTo(self.view.width);
        make.bottom.equalTo(self.tableView.top);
        make.height.mas_equalTo(searchBarHeight);
    }];
        
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.bottom);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.width.equalTo(self.view.width);
        make.bottom.equalTo(self.view.bottom);
    }];
}

- (void)showResults:(BOOL) show {
    if(show) {
        self.tableView.hidden = false;
    }else {
        self.tableView.hidden = true;
    }
}

#pragma mark - SearchButtonDelegate

- (void)searchButtonTapped:(SearchBarView *)sender {
    [self showResults:false];
    
    APIManager *manager = [[APIManager alloc] init];
    [manager fetchUserPosts:sender.usernameTextField.text completion:^(BOOL success, NSMutableArray* postsArray) {
        if(success) {
            self.postsArray = postsArray;
            [self showResults:true];
            [self.tableView reloadData];
    
        }else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Invalid username" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {
    return [self.postsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    NSString *title = self.postsArray[indexPath.row].description;
    if(![title isEqualToString:@""]) {
        cell.textLabel.text = self.postsArray[indexPath.row].description;
    }else {
        cell.textLabel.text = @"No description for post";
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailPostViewController *detailController = [[DetailPostViewController alloc] init];
    detailController.post = self.postsArray[indexPath.row];
    [self.navigationController pushViewController:detailController animated:YES];
}

@end
