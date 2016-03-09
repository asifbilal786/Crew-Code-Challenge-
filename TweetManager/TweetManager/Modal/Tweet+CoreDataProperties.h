//
//  Tweet+CoreDataProperties.h
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//  Copyright © 2016 DevCrew. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tweet (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *profileImageURL;
@property (nullable, nonatomic, retain) NSString *tweetText;
@property (nullable, nonatomic, retain) NSString *username;

@end

NS_ASSUME_NONNULL_END
