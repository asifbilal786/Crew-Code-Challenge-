//
//  TMUtility.m
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-05.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import "TMUtility.h"
#import "AppDelegate.h"

@implementation TMUtility

+ (void)showAlertWithTitle:(NSString *)title withMessage:(NSString *)message {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

@end
