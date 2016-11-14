//
//  ViewController.m
//  动画
//
//  Created by  艾立丰 on 16/10/31.
//  Copyright (c) 2016年  艾立丰. All rights reserved.
//


#import "ViewController.h"
#import "wendu_yuan2.h"
#import "UICountingLabel.h"
#define MAS_SHORTHAND
#import "Masonry.h"
#import "UIColor+Hex.h"

@interface ViewController ()

@property (nonatomic,strong) wendu_yuan2 *progressView;
@property (nonatomic,strong) UIImageView *boardImgView;
@property (nonatomic,strong) UICountingLabel *pointLab;//分数
@property (nonatomic,strong) UILabel *judgeLab;//评价等级
@property (nonatomic,assign) int point;
@property (nonatomic,strong) UIButton *checkBtn;

@property (nonatomic, strong) UIImageView *imagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHex:0x0d87cd];
    [self initCircleView];
    
    [self.view addSubview:self.imagView];
    
    
    NSMutableArray  *arrayM=[NSMutableArray array];
    for (int i=0; i<6; i++) {
        [arrayM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"guzhang%d",i+1]]];
    }
    //设置动画数组
    [self.imagView setAnimationImages:arrayM];
    //设置动画播放次数
    [self.imagView setAnimationRepeatCount:0];
    //设置动画播放时间
    [self.imagView setAnimationDuration:6*0.1];
    
    
}
- (UIImageView *)imagView{
    if (!_imagView) {
        _imagView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-12, self.view.frame.size.height/2-80, 32, 28)];
        _imagView.image = [UIImage imageNamed:@"guzhang1"];
    }
    return _imagView;
}


-(void)initCircleView
{
    [self.view addSubview:self.boardImgView];
    [self.view addSubview:self.progressView];
    
    [self.boardImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerXX.mas_equalTo(self.progressView.mas_centerXX);
        make.centerYY.mas_equalTo(self.progressView.mas_centerYY);
        make.width.mas_equalTo(330);
        make.height.mas_equalTo(330);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.size.mas_equalTo(CGSizeMake(AUTO_3PX(980), AUTO_3PX(980)));
        make.centerXX.mas_equalTo(self.view.centerXX);
        make.top.mas_equalTo(140);
        make.width.mas_equalTo(self.boardImgView).mas_offset(-30);
        make.height.mas_equalTo(self.boardImgView).mas_offset(-30);
    }];
    self.point = 100.0;
//    self.progressView.progress = (800.0-300)/(850-300.0);
    self.progressView.progress = 100.0/200.0;
    
    self.boardImgView.backgroundColor = [UIColor clearColor];
    [self.view bringSubviewToFront:self.progressView];
    
    [self.progressView addSubview:self.pointLab];
    [self.pointLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.progressView.mas_width);
        make.height.mas_equalTo(60);
        make.centerXX.equalTo(self.progressView.centerXX);
        make.centerYY.equalTo(self.progressView.centerYY).mas_offset(-10);
    }];
    
    
    [self.progressView addSubview:self.judgeLab];
    [self.judgeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.progressView);
        make.top.mas_equalTo(self.pointLab.mas_bottom);
        make.left.mas_equalTo(self.progressView.mas_left);
    }];
    self.judgeLab.text = @"心率正常";
    
    [self.view addSubview:self.checkBtn];
    [self.checkBtn addTarget:self action:@selector(startAnim) forControlEvents:UIControlEventTouchUpInside];
    [self.checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-80);
        make.centerXX.mas_equalTo(self.view.centerXX);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(66);
    }];
}
-(void)startAnim
{
    self.pointLab.method = UILabelCountingMethodLinear;
    self.pointLab.format = @"%d";
    [self.pointLab countFrom:1 to:self.point withDuration:1.5];
    [self.progressView start];
    [self.imagView startAnimating];
    
}
#pragma mark - property
-(UIButton *)checkBtn
{
    if (_checkBtn == nil) {
        _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_checkBtn setBackgroundImage:[UIImage imageNamed:@"whiteBtn"] forState:UIControlStateNormal];
        [_checkBtn setTitle:@"开始测量" forState:UIControlStateNormal];
        [_checkBtn setTitleColor:[UIColor colorWithHex:0x0d87cd] forState:UIControlStateNormal];
        _checkBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        
        _checkBtn.backgroundColor = [UIColor clearColor];
        _checkBtn.titleEdgeInsets = UIEdgeInsetsMake(-18, 0, 0, 0);
    }
    return _checkBtn;
}
-(wendu_yuan2*)progressView
{
    if (_progressView  == nil) {
        _progressView = [[wendu_yuan2 alloc]init];
        _progressView.backgroundColor = [UIColor clearColor];
        ;
    }
    return _progressView;
}
-(UICountingLabel *)pointLab
{
    if (!_pointLab) {
        _pointLab = [[UICountingLabel alloc]init];
        _pointLab.textAlignment = NSTextAlignmentCenter;
        _pointLab.font = [UIFont systemFontOfSize:60];
        _pointLab.textColor = [UIColor whiteColor];
    }
    return _pointLab;
}
-(UILabel *)judgeLab
{
    if (!_judgeLab) {
        _judgeLab = [[UILabel alloc]init];
        _judgeLab.textAlignment = NSTextAlignmentCenter;
        _judgeLab.font = [UIFont systemFontOfSize:16];
        _judgeLab.textColor = [UIColor whiteColor];
    }
    return _judgeLab;
}
-(UIImageView*)boardImgView
{
    if (_boardImgView  == nil) {
        _boardImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"board"]];
    }
    return _boardImgView;
}

@end
