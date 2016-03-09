//
//  Tweet.h
//  
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tweet : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (Tweet *)tweetWithDictionary:(NSDictionary *)dictTweet;

@end

NS_ASSUME_NONNULL_END

#import "Tweet+CoreDataProperties.h"
