
#import "APIManager.h"
#import "AFHTTPSessionManager.h"
#import "XMLReader.h"
#import "Post.h"

@implementation APIManager

-(void)fetchUserPosts:(NSString*)username completion:(void (^)(BOOL success, NSMutableArray *message))completion {
    
    NSString *url, *urlRequestId;
    url = [[@"http://" stringByAppendingString:username] stringByAppendingString:@".tumblr.com/api/read"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url
      parameters:nil
     
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSLog(@"Request fetched successfully");
             
             NSError *error = nil;
             NSDictionary *dict = [XMLReader dictionaryForXMLData:responseObject
                                                          options:XMLReaderOptionsProcessNamespaces
                                                            error:&error];
             NSLog(@"dictionary %@", dict);
             
            NSMutableArray * postsArray = [[NSMutableArray alloc] init];
            NSDictionary * postsDictionary = [[[dict objectForKey:@"tumblr"] objectForKey:@"posts"] objectForKey:@"post"];
             
             //We check if posts are returned as array or just a dictionary with single value
             if([postsDictionary isKindOfClass:[NSArray class]]){
                 for (NSDictionary* posts in postsDictionary) {
                     Post *post = [[Post alloc] initWithDictionary:posts];
                     [postsArray addObject: post];
                 }
                 
             }else {
                 Post *post = [[Post alloc] initWithDictionary:postsDictionary];
                 [postsArray addObject: post];
             }
             
             completion(true, postsArray);
         }
     
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSString *requestString = task.originalRequest.URL.absoluteString;
             NSLog(@"Fetching posts failed%@", requestString);
             
             NSString* ErrorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
             NSLog(@"%@",ErrorResponse);
             completion(false, nil);
         }
     ];

}

@end
