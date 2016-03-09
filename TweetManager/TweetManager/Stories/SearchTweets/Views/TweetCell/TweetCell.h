//
//  TweetCell.h
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"


typedef NS_ENUM(NSInteger, ButtonType) {
    TypeSave,
    TypeDelete
};

@protocol TweetCellDelegate;

@interface TweetCell : UITableViewCell

- (void)configureCell:(Tweet *)tweet withButtonType:(ButtonType)buttonType;

@property (nonatomic,weak) id <TweetCellDelegate> delegate;

@end

@protocol TweetCellDelegate <NSObject>
- (void)cell:(TweetCell *)cell withTweet:(Tweet *)tweet didTapSaveButton:(UIButton *)buton;
- (void)cell:(TweetCell *)cell withTweet:(Tweet *)tweet didTapDeleteButton:(UIButton *)button;
@end

