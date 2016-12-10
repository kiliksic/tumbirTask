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
    
//    self.backgroundColor = [UIColor blackColor];
    
    _usernameTextField = UITextField.new;
    _usernameTextField.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    _usernameTextField.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
    _usernameTextField.textAlignment = NSTextAlignmentCenter;
    _usernameTextField.placeholder = @"Username";
    _usernameTextField.backgroundColor=[UIColor whiteColor];
    _usernameTextField.layer.borderWidth=1.0;
    _requestButton = [[UIButton alloc] init];
    
    [self addSubview:_usernameTextField];
    [self addSubview: _requestButton];
    
    int height = 30;
    
    [_usernameTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left);
        make.bottom.equalTo(self.bottom);
        
        make.width.equalTo(self.width).multipliedBy(0.7);
//        make.height.mas_equalTo(height);
    }];

//    UIView *greenView = UIView.new;
//    greenView.backgroundColor = UIColor.greenColor;
//    greenView.layer.borderColor = UIColor.blackColor.CGColor;
//    greenView.layer.borderWidth = 2;
//    [self addSubview:greenView];
//
//    UIView *redView = UIView.new;
//    redView.backgroundColor = UIColor.redColor;
//    redView.layer.borderColor = UIColor.blackColor.CGColor;
//    redView.layer.borderWidth = 2;
//    [self addSubview:redView];
    
    UIView *superview = self;
    int padding = 5;
    int topPadding = 70;
    
//    [greenView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(superview.top).offset(topPadding);
//        make.left.equalTo(superview.left);
//        make.right.equalTo(redView.left).offset(-padding);
//        make.width.equalTo(self.width).multipliedBy(0.7);
//        
//        make.height.mas_equalTo(height);
//    }];
//    
//    //with is semantic and option
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(superview.mas_top).with.offset(topPadding); //with with
//        make.left.equalTo(greenView.mas_right).offset(padding); //without with
//        make.right.equalTo(superview.mas_right).offset(-padding);
//        make.width.equalTo(self.width).multipliedBy(0.25);
//        make.height.equalTo(greenView.height);
//        
//    }];
    return self;
}


@end
