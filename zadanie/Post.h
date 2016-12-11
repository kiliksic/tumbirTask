//
//  Post.h
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, retain) NSString *postId;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSDictionary *photoUrl;

-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
