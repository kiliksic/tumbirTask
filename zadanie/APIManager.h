
#import <Foundation/Foundation.h>

@interface APIManager : NSObject

-(void)fetchUserPosts:(NSString*)username completion:(void (^)(BOOL success, NSMutableArray *message))completion;

@end
