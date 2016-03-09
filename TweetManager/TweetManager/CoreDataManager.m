//
//  CoreDataManager.m
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import "CoreDataManager.h"
#import "TMUtility.h"

@interface CoreDataManager()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation CoreDataManager

+ (CoreDataManager *)sharedManager{
    
    static CoreDataManager * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Do any other initialisation stuff here
        sharedInstance = [[CoreDataManager alloc] init];
    });
    return sharedInstance;
}

- (CoreDataManager *)init{
    
    NSLog(@"CoreDataManager Init Called");
    if ((self = [super init])) {
        self.managedObjectContext = [appDelegate managedObjectContext];
    }
    return self;
}

- (NSError *)insertNewObject: (NSManagedObject *)object {
    
    [self.managedObjectContext insertObject:object];
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        //Respond to the error
        return  error;
    }

    return nil;
}

- (NSError *)deleteObject: (NSManagedObject *)object {
    
    [self.managedObjectContext deleteObject:object];
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        //Respond to the error
        return  error;
    }
    
    return nil;
}

- (NSArray *)getAllObjectsFor:(NSString *)entityName {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
        return nil;
    }
    
    return result;
}

@end
