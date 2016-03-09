//
//  TweetCell.m
//  TweetManager
//
//  Created by Awais Arshad Chatha on 2016-03-06.
//  Copyright © 2016 DevCrew. All rights reserved.
//

#import "TweetCell.h"
#import <UIImageView+AFNetworking.h>

@interface TweetCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

@property(nonatomic,assign) ButtonType buttonType;
@property (weak, nonatomic) Tweet *tweet;
- (IBAction)buttonHandler:(id)sender;

@end

@implementation TweetCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView layoutIfNeeded];
    self.tweetText.preferredMaxLayoutWidth = CGRectGetWidth(self.tweetText.frame);
}

- (void)configureCell:(Tweet *)tweet withButtonType:(ButtonType)buttonType{
    
    self.tweet = tweet;
    
    [self.userImage setImageWithURL:[NSURL URLWithString:tweet.profileImageURL]];
    self.username.text = tweet.username;
    self.tweetText.text = tweet.tweetText;
    
    self.buttonType = buttonType;
    
    NSString * buttonTitle = Nil;
    
    switch (buttonType) {
        case TypeSave:
            buttonTitle = @"Save";
            break;
        
        case TypeDelete:
            buttonTitle = @"Delete";
            break;
            
        default:
            break;
    }
    
    [self.actionButton setTitle:buttonTitle forState:UIControlStateNormal];
}



- (IBAction)buttonHandler:(id)sender {
    
    switch (self.buttonType) {
        case TypeSave:
            if ([self.delegate respondsToSelector:@selector(cell:withTweet:didTapSaveButton:)]) {
                [self.delegate cell:self withTweet:self.tweet didTapSaveButton:sender];
            }
            break;
            
        case TypeDelete:
            if ([self.delegate respondsToSelector:@selector(cell:withTweet:didTapDeleteButton:)]) {
                [self.delegate cell:self withTweet:self.tweet didTapDeleteButton:sender];
            }
            break;
            
        default:
            break;
    }
}

@end
