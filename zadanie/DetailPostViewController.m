//
//  DetailPostViewController.m
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import "DetailPostViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailPostViewController ()

@property (strong, nonatomic) UIImageView *postImageView;

@end

@implementation DetailPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.post.description;
    [self setupView];
    
//    NSLog(@"AAAAaaa %@", self.post.photoUrl);
    NSMutableArray * photoArray = self.post.photoUrl;
    NSString *photoUrl = [photoArray[0] objectForKey:@"text"];
    
//    NSLog(@"BBBB %@", photoUrl);
    [_postImageView sd_setImageWithURL:[NSURL URLWithString:photoUrl]
                 placeholderImage:[UIImage imageNamed:@"empty.png"]];
}

- (void)setupView {
    _postImageView = UIImageView.new;
    [self.view addSubview:_postImageView];
    
    [_postImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.bottom.equalTo(self.view.bottom);
    }];
}

@end
