//
//  CoreDataManager.h
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

#define dataManager [CoreDataManager sharedManager]

@interface CoreDataManager : NSObject

+(CoreDataManager *)sharedManager;

- (NSError *)insertNewObject: (NSManagedObject *)object;
- (NSError *)deleteObject: (NSManagedObject *)object;
- (NSArray *)getAllObjectsFor:(NSString *)entityName;

@end
