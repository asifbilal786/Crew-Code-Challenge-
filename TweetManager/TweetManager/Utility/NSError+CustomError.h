//
//  NSError+CustomError.h
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (CustomError)
+ (NSError *)errorWithString:(NSString *)errorText withErrorCode:(NSUInteger )errorCode;
@end
