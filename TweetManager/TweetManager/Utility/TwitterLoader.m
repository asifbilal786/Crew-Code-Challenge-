//
//  TwitterLoader.m
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-05.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import "TwitterLoader.h"
#import "Tweet.h"
#import "NSError+CustomError.h"

#import <Accounts/Accounts.h>
#import <Social/Social.h>

@implementation TwitterLoader


- (void) getTweetsWithText:(NSString *)text withSuccessBlock:(void (^) (NSArray *tweets))success failureBlock:(void (^) (NSError *error))failure
{
    // Request access to the Twitter accounts
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error){
        if (granted) {
            
            NSArray *accounts = [accountStore accountsWithAccountType:accountType];
            
            // Check if the users has setup at least one Twitter account
            
            if (accounts.count > 0)
            {
                ACAccount *twitterAccount = accounts.firstObject;
                
                // Creating a request to get the info about a user on Twitter
                
                NSDictionary *parameters = @{ @"q" : text };
                
                SLRequest *twitterInfoRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:@"https://api.twitter.com/1.1/search/tweets.json"] parameters: parameters];
                [twitterInfoRequest setAccount:twitterAccount];
                
                // Making the request
                
                [twitterInfoRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                        
                        // Check if we reached the reate limit
                        
                        if ([urlResponse statusCode] == 429) {
                            NSLog(@"Rate limit reached");
                            NSError *error = [NSError errorWithString:@"Rate limit reached" withErrorCode:[urlResponse statusCode]];
                            failure(error);
                            return;
                        }
                        
                        // Check if there was an error
                        
                        if (error) {
                            NSLog(@"Error: %@", error.localizedDescription);
                            failure(error);
                            return;
                        }
                        
                        // Check if there is some response data
                        
                        if (responseData) {
                            
                            NSError *error = nil;
                            NSDictionary *TWData = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
                            NSArray *statuses = TWData[@"statuses"];
                            
                            if (error != nil) {
                                failure(error);
                                return;
                            }

                            NSMutableArray *tweets = [NSMutableArray arrayWithCapacity:statuses.count];
                            
                            [statuses enumerateObjectsUsingBlock:^(NSDictionary *dictTweet, NSUInteger idx, BOOL *stop) {
                                
                                Tweet *tweet = [Tweet tweetWithDictionary:dictTweet];
                                [tweets addObject:tweet];
                                
                            }];
                            
                            success(tweets);
                            
                        }
                }];
            } else {
                
                NSLog(@"No account configured");
                NSError *error = [NSError errorWithString:@"Please login twitter from Settings app." withErrorCode:-1];
                failure(error);
                return;
                
            }
        } else {
            NSLog(@"No access granted");
            NSError *error = [NSError errorWithString:@"No access granted" withErrorCode:-1];
            failure(error);
            return;
        }
    }];
}

@end
