
#import "ImageDownloader.h"

@interface ImageDownloader()

@end

@implementation ImageDownloader

+(void)downloadImageWithUrl:(NSString*)url
                   progress:(void(^)(NSInteger receivedSize, NSInteger expectedSize))progress
                 completion:(void(^)(UIImage* image, NSError * error, SDImageCacheType cacheType))completion
{
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url]
                                                    options:0
                                                   progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                       progress(receivedSize, expectedSize);
                                                   }
                                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                      completion(image, error, cacheType);
                                                  }];
}

@end
