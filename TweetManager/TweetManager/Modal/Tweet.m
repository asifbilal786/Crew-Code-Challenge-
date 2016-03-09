//
//  Tweet.m
//  
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//
//

#import "Tweet.h"
#import "AppDelegate.h"

@implementation Tweet

// Insert code here to add functionality to your managed object subclass
+ (Tweet *)tweetWithDictionary:(NSDictionary *)dictTweet {
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Tweet" inManagedObjectContext:[appDelegate managedObjectContext]];
    
    Tweet *tweet = [[Tweet alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:nil];
    tweet.tweetText        = dictTweet[@"text"];
    tweet.username         = dictTweet[@"user"] [@"name"];
    tweet.profileImageURL  = dictTweet[@"user"] [@"profile_image_url"];
    return tweet;
}

@end
