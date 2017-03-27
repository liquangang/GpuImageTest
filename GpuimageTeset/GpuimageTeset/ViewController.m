//
//  ViewController.m
//  GpuimageTeset
//
//  Created by 必要 on 2017/3/23.
//  Copyright © 2017年 必要. All rights reserved.
//

#import "ViewController.h"
#import "StyleCollectionViewCell.h"
#import "ImageUtil.h"
#import "ColorMatrix.h"
#import <Masonry.h>

#define StyleImage @"stylePreviewImage"
#define StyleTitle @"styleTitle"

static NSString *const itemResuableStr = @"StyleCollectionViewCell";

@interface ViewController ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
>

@property (nonatomic, strong) UIImageView *originalImage;
@property (nonatomic, strong) UIImageView *renderingFinishImage;
@property (nonatomic, strong) UICollectionView *selectStyleCollectionView;
@property (nonatomic, strong) NSMutableArray *styleInfoMuArray;
@property (nonatomic, strong) NSIndexPath *selectIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.styleInfoMuArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StyleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemResuableStr forIndexPath:indexPath];
    
    //判断显示颜色
    UIColor *tempColor = (self.selectIndex == indexPath) ? [UIColor redColor] : [UIColor groupTableViewBackgroundColor];
    [cell setItemWithDic:self.styleInfoMuArray[indexPath.item] BackColor:tempColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //设置大图
    self.originalImage.image = [self.styleInfoMuArray[indexPath.item] objectForKey:StyleImage];
    
    //设置选中位置
    self.selectIndex = indexPath;
    
    //刷新collectionView
    [self.selectStyleCollectionView reloadData];
}

#pragma mark - interface

- (void)setUI{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.originalImage];
    [self.view addSubview:self.selectStyleCollectionView];
    [self setLayout];
}

- (void)setLayout{
    
    // 防止block中的循环引用
    __weak typeof (self) weakSelf = self;
    
    [self.originalImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(0);
        make.top.equalTo(weakSelf.view).with.offset(0);
        make.right.equalTo(weakSelf.view).with.offset(0);
        make.bottom.equalTo(weakSelf.view).with.offset(-88);
    }];
    
    [self.selectStyleCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(0);
        make.top.equalTo(weakSelf.originalImage.mas_bottom).with.offset(0);
        make.right.equalTo(weakSelf.view).with.offset(0);
        make.bottom.equalTo(weakSelf.view).with.offset(0);
    }];
}

#pragma mark - getter

- (UIImageView *)originalImage{
    if (!_originalImage) {
        UIImageView *tempImageView = [[UIImageView alloc] init];
        tempImageView.image = [UIImage imageNamed:@"testImage"];
        tempImageView.contentMode = UIViewContentModeScaleAspectFit;
        _originalImage = tempImageView;
    }
    return _originalImage;
}

- (UICollectionView *)selectStyleCollectionView{
    if (!_selectStyleCollectionView) {
        
        //设置layout
        CGFloat screenWidth = CGRectGetWidth(self.view.frame);
        UICollectionViewFlowLayout *tempLayout = [[UICollectionViewFlowLayout alloc] init];
        tempLayout.itemSize = CGSizeMake(screenWidth / 5, 88);
        tempLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        tempLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        tempLayout.minimumLineSpacing = 0;
        tempLayout.minimumInteritemSpacing = 0;
        
        //设置collectionView
        UICollectionView *tempCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:tempLayout];
        [tempCollectionView registerClass:[StyleCollectionViewCell class] forCellWithReuseIdentifier:itemResuableStr];
        tempCollectionView.delegate = self;
        tempCollectionView.dataSource = self;
        tempCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _selectStyleCollectionView = tempCollectionView;
    }
    return _selectStyleCollectionView;
}

- (NSMutableArray *)styleInfoMuArray{
    if (!_styleInfoMuArray) {
        NSMutableArray *tempMuArray = [NSMutableArray arrayWithObjects:
                                       @{@"styleTitle":@"原始",
                                         @"stylePreviewImage":self.originalImage.image},
                                       @{@"styleTitle":@"lomo",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_lomo]},
                                       @{@"styleTitle":@"黑白",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_heibai]},
                                       @{@"styleTitle":@"怀旧",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_huaijiu]},
                                       @{@"styleTitle":@"哥特",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_gete]},
                                       @{@"styleTitle":@"淡雅",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_danya]},
                                       @{@"styleTitle":@"酒红",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_jiuhong]},
                                       @{@"styleTitle":@"清宁",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_qingning]},
                                       @{@"styleTitle":@"浪漫",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_langman]},
                                       @{@"styleTitle":@"光晕",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_guangyun]},
                                       @{@"styleTitle":@"蓝调",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_landiao]},
                                       @{@"styleTitle":@"梦幻",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_menghuan]},
                                       @{@"styleTitle":@"夜色",
                                         @"stylePreviewImage":[ImageUtil imageWithImage:self.originalImage.image withColorMatrix:colormatrix_yese]},nil];
        
        _styleInfoMuArray = tempMuArray;
    }
    return _styleInfoMuArray;
}

@end
