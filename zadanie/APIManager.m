
#import "APIManager.h"
#import "AFHTTPSessionManager.h"
#import "XMLReader.h"
#import "Post.h"

@implementation APIManager

-(void)fetchUserPosts:(NSString*)username completion:(void (^)(BOOL success))completion {
    
    NSString *url, *urlRequestId;
    url = @"http://zolloc.tumblr.com/api/read?num=2";
//    urlRequestId = [[url stringByAppendingString:requestId] stringByAppendingString:@"?access_token="];
    
//    KeychainItemWrapper *keychainDefaultToken = [[KeychainItemWrapper alloc] initWithIdentifier:@"keychainDefaultToken" accessGroup:nil];
    
//    NSString *completeURL = [urlRequestId stringByAppendingString:[keychainDefaultToken objectForKey:(__bridge id)kSecAttrAccount]];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url
      parameters:nil
     
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSLog(@"Request fetched successfully");
             
             NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             
             NSError *error = nil;
             NSDictionary *dict = [XMLReader dictionaryForXMLData:responseObject
                                                          options:XMLReaderOptionsProcessNamespaces
                                                            error:&error];
             NSLog(@"dictionary %@", dict);
             
             NSLog(@"objekcikc %@", [[[dict objectForKey:@"tumblr"] objectForKey:@"posts"] objectForKey:@"post"]);
             
             NSDictionary * postsDictionary = [[[dict objectForKey:@"tumblr"] objectForKey:@"posts"] objectForKey:@"post"];
             NSMutableArray * postsArray = [[NSMutableArray alloc] init];
             
             for (NSDictionary* posts in postsDictionary) {
                 Post *post = [[Post alloc] initWithDictionary:posts];
                 [postsArray addObject: post];
             
             }

             completion(true);
         }
     
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSString *requestString = task.originalRequest.URL.absoluteString;
             NSLog(@"Fetching posts failed%@", requestString);
             
             NSString* ErrorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
             NSLog(@"%@",ErrorResponse);
             completion(false);
         }
     ];

}

@end
