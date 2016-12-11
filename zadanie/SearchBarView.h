//
//  SearchBarView.h
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SearchBarView;

@protocol SearchButtonDelegate <NSObject>
- (void) searchButtonTapped: (SearchBarView *) sender;
@end

@interface SearchBarView : UIView

@property (nonatomic, weak) id <SearchButtonDelegate> delegate;
@property (strong, nonatomic) UITextField *usernameTextField;
@property (strong, nonatomic) UIButton *requestButton;

@end
