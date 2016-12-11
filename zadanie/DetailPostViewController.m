//
//  DetailPostViewController.m
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import "DetailPostViewController.h"
#import "ImageDownloader.h"

@interface DetailPostViewController ()

@property (strong, nonatomic) UIImageView *postImageView;

@end

@implementation DetailPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.post.description;
    [self setupView];
    [self downloadPostImage];
}

- (void)setupView {
    _postImageView = UIImageView.new;
    UIImage *placeholderImage = [UIImage imageNamed:@"empty.png"];
    [_postImageView setImage: placeholderImage];
    [self.view addSubview:_postImageView];
    
    [_postImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.bottom.equalTo(self.view.bottom);
    }];
    
    [self setCustomBackButton];
}

- (void)setCustomBackButton {
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed)];
    self.navigationItem.leftBarButtonItem = customBarItem;
}

- (void) backButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - ImageDownloader

- (void) downloadPostImage {
    NSMutableArray * photoArray = self.post.photoUrl;
    NSString *photoUrl = [photoArray[0] objectForKey:@"text"];
    
    [ImageDownloader downloadImageWithUrl:photoUrl progress:^(NSInteger receivedSize, NSInteger expectedSize) {} completion:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        [_postImageView setImage:image];
    }];
}

@end
