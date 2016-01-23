//
//  ZDYNewsListCell.m
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import "ZDYNewsListCell.h"

@interface ZDYNewsListCell ()

@property (nonatomic, strong) UIImageView * newsImageView;
@property (nonatomic, strong) UILabel * newsTitleLabel;
@property (nonatomic, strong) UILabel * newsTimeLabel;


@end

@implementation ZDYNewsListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.newsImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.newsImageView];
    self.newsImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.newsImageView.layer.cornerRadius = 5;
    [self.newsImageView.layer setMasksToBounds:YES];
    [self.newsImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(self.contentView).offset(-5);
        make.width.equalTo(SCREEN_WIDTH * 0.35);
    }];
    
    self.newsTitleLabel = [[UILabel alloc] init];
    [self.newsTitleLabel setFont:[UIFont systemFontOfSize:15]];
    self.newsTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.newsTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.newsTitleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.newsTitleLabel];
    [self.newsTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newsImageView.right).offset(5);
        make.top.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.contentView).offset(-5);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];
    
    
    return self;
}

- (void)setNewsModel:(ZDYNewsModel *)newsModel {
    
    _newsModel = newsModel;
    
    [self.newsImageView setImageWithURL:newsModel.picUrl placeholderImage:nil];
    [self.newsTitleLabel setText:newsModel.title];
    
}


@end
