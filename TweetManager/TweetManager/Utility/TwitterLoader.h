//
//  TwitterLoader.h
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-05.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TwitterLoader : NSObject
- (void) getTweetsWithText:(NSString *)text withSuccessBlock:(void (^) (NSArray *tweets))success failureBlock:(void (^) (NSError *error))failure;
@end
