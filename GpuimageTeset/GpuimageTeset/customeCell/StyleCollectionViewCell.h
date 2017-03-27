//
//  StyleCollectionViewCell.h
//  GpuimageTeset
//
//  Created by liquangang on 2017/3/24.
//  Copyright © 2017年 必要. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StyleCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *styleImageView;
@property (nonatomic, strong) UILabel *styleTitleLabel;

//设置item的展示内容
- (void)setItemWithDic:(NSMutableDictionary *)styleInfoDic BackColor:(UIColor *)backColor;
@end
