//
//  ViewController.m
//  GpuimageTeset
//
//  Created by 必要 on 2017/3/23.
//  Copyright © 2017年 必要. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic, strong) UIImageView *originalImage;
@property (nonatomic, strong) UIImageView *renderingFinishImage;
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

#pragma mark - interface

- (void)setUI{
    [self.view addSubview:self.originalImage];
}

#pragma mark - getter

- (UIImageView *)originalImage{
    
    if (!_originalImage) {
        UIImageView *tempImageView = [[UIImageView alloc] init];
        tempImageView.frame = CGRectMake(0, 0, 100, 100);
        tempImageView.image = [UIImage imageNamed:@"testImage"];
        _originalImage = tempImageView;
    }
    return _originalImage;
}

@end
