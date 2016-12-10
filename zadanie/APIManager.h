

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

-(void)fetchUserPosts:(NSString*)username completion:(void (^)(BOOL success))completion;

@end
