//
//  NSError+CustomError.m
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import "NSError+CustomError.h"

@implementation NSError (CustomError)

+ (NSError *)errorWithString:(NSString *)errorText withErrorCode:(NSUInteger )errorCode {
    
    NSError *error = [NSError errorWithDomain:@"com.Tweet" code:errorCode userInfo:@{ NSLocalizedDescriptionKey : errorText}];
    return error;
    
}

@end
