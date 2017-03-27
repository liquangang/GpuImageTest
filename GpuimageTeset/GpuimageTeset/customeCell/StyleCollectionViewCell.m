//
//  StyleCollectionViewCell.m
//  GpuimageTeset
//
//  Created by liquangang on 2017/3/24.
//  Copyright © 2017年 必要. All rights reserved.
//

#import "StyleCollectionViewCell.h"
#import <Masonry.h>

@implementation StyleCollectionViewCell

#pragma mark - interface

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self.contentView addSubview:self.styleImageView];
    [self.contentView insertSubview:self.styleTitleLabel aboveSubview:self.styleImageView];
    [self setLayout];
}

- (void)setLayout{
    
    // 防止block中的循环引用
    __weak typeof (self) weakSelf = self;
    
    [self.styleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.contentView);
        make.edges.mas_equalTo(UIEdgeInsetsMake(15, 5, 30, 5));
    }];
    
    [self.styleTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.contentView);
        make.top.equalTo(weakSelf.styleImageView.mas_bottom).with.offset(0);
        make.left.equalTo(weakSelf.contentView.mas_left).with.offset(0);
        make.right.equalTo(weakSelf.contentView.mas_right).with.offset(0);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).with.offset(-8);
    }];
}

//设置cell内容
- (void)setItemWithDic:(NSMutableDictionary *)styleInfoDic BackColor:(UIColor *)backColor{
    self.styleImageView.layer.borderColor = backColor.CGColor;
    self.styleImageView.layer.borderWidth = 5;
//    self.backgroundColor = backColor;
    self.styleImageView.image = [styleInfoDic objectForKey:@"stylePreviewImage"];
    self.styleTitleLabel.text = [styleInfoDic objectForKey:@"styleTitle"];
}

#pragma mark - getter

- (UIImageView *)styleImageView{
    if (!_styleImageView) {
        UIImageView *tempImageView = [[UIImageView alloc] init];
        tempImageView.contentMode = UIViewContentModeScaleAspectFill;
        tempImageView.clipsToBounds = YES;
        _styleImageView = tempImageView;
    }
    return _styleImageView;
}

- (UILabel *)styleTitleLabel{
    if (!_styleTitleLabel) {
        UILabel *tempLabel = [[UILabel alloc] init];
        tempLabel.font = [UIFont systemFontOfSize:13];
        tempLabel.textAlignment = NSTextAlignmentCenter;
        _styleTitleLabel = tempLabel;
    }
    return _styleTitleLabel;
}

@end
