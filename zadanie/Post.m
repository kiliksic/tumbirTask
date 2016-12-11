//
//  Post.m
//  zadanie
//
//  Created by Kacper Wolnik on 10.12.2016.
//  Copyright © 2016 Kacper Wolnik. All rights reserved.
//

#import "Post.h"

@implementation Post
@synthesize postId, description, url, photoUrl;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        self.postId = dictionary[@"id"];
        self.description = dictionary[@"slug"];
        self.url = dictionary[@"url"];
        self.photoUrl = dictionary[@"photo-url"];
    }
    return self;
}

@end
