//
//  SearchBarView.m
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import "SearchBarView.h"

@implementation SearchBarView
@synthesize delegate;

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    [self setupView];

    return self;
}

- (void) setupView {
    //Username TextField customization
    _usernameTextField = UITextField.new;
    _usernameTextField.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    _usernameTextField.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    _usernameTextField.textAlignment = NSTextAlignmentCenter;
    _usernameTextField.placeholder = @"username";
    _usernameTextField.backgroundColor=[UIColor whiteColor];
    _usernameTextField.layer.borderWidth=1.0;
    
    [_usernameTextField addTarget:self action:@selector(textFieldDidChange:)
                 forControlEvents:UIControlEventEditingChanged];
    
    //Search Request button customization
    _requestButton = UIButton.new;
    UIImage *searchImage = [UIImage imageNamed:@"search"];
    UIImage *searchSelected = [UIImage imageNamed:@"search_selected"];
    [_requestButton setImage:searchImage forState:UIControlStateNormal];
    [_requestButton setImage:searchSelected forState:UIControlStateHighlighted];
    
    [_requestButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_usernameTextField];
    [self addSubview: _requestButton];
    
    //Setting constraints
    [_usernameTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left);
        make.right.equalTo(_requestButton.left);
        make.bottom.equalTo(self.bottom);
        make.width.equalTo(self.width).multipliedBy(0.85);
    }];
    
    [_requestButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(_usernameTextField.right);
        make.right.equalTo(self.right);
        make.bottom.equalTo(self.bottom);
    }];

}

//Make sure that typed string username is lowercase
- (void)textFieldDidChange:(UITextField*)textField {
    textField.text = [textField.text lowercaseString];
}

- (void)buttonClicked:(UIButton*)sender
{
    [self.delegate searchButtonTapped:self];
}


@end
