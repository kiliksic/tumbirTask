
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"

@interface ImageDownloader : NSObject

+(void)downloadImageWithUrl:(NSString*)url
                   progress:(void(^)(NSInteger receivedSize, NSInteger expectedSize))progress
                 completion:(void(^)(UIImage* image, NSError * error, SDImageCacheType cacheType))completion;

@end
