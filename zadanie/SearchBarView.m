//
//  SearchBarView.m
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import "SearchBarView.h"

@implementation SearchBarView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.backgroundColor = [UIColor blackColor];

    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    
    UIView *superview = self;
    int padding = 10;
    int topPadding = 70;
    int height = 30;
    
    //if you want to use Masonry without the mas_ prefix
    //define MAS_SHORTHAND before importing Masonry.h see Masonry iOS Examples-Prefix.pch
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.top).offset(topPadding);
        make.left.equalTo(superview.left).offset(padding);
        make.right.equalTo(redView.left).offset(-padding);
        make.width.equalTo(redView.width);
        
        make.height.mas_equalTo(height);
    }];
    
    //with is semantic and option
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(topPadding); //with with
        make.left.equalTo(greenView.mas_right).offset(padding); //without with
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.width.equalTo(greenView.mas_width);
        make.height.equalTo(greenView.height);
        
    }];
    return self;
}




@end
