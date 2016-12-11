
#import <Foundation/Foundation.h>

@interface APIManager : NSObject

@property (nonatomic, strong) NSString * url;

-(void)fetchUserPosts:(NSString*)username completion:(void (^)(BOOL success, NSMutableArray *message))completion;

@end
