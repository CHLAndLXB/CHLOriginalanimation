//
//  yuan2_dt.h
//  2014621
//
//  Created by 孔凡群 on 14-7-1.
//  Copyright (c) 2014年 孔凡群. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface yuan2_zj : UIView
//中心点坐标
@property(nonatomic)CGPoint point;
//半径，底层半径，上层半径，中间层半径
@property(nonatomic)float bj;
//温度计宽度，线的宽度
@property(nonatomic)float zj_kd;

@property(nonatomic)float z1,z2;

//渐变层坐标大小
@property(nonatomic)CGRect rect1,rect2;

@property(nonatomic)float z;

@property(nonatomic)CAGradientLayer * gradientlayer1,*gradientlayer2;

@property(nonatomic)CALayer * layer_d;

@property(nonatomic)CAShapeLayer * shapelayer;

@property(nonatomic)NSArray * array1,*array2;

@property(nonatomic)UIBezierPath * apath;

@property(nonatomic)CABasicAnimation *animation;
@property (nonatomic)float toValue;//好信分比例
-(void)startAnimaition;
@end
