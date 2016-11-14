//
//  ddd.h
//  2014621
//
//  Created by 孔凡群 on 14-7-1.
//  Copyright (c) 2014年 孔凡群. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface yuan2_sc : UIView
@property(nonatomic)CAShapeLayer * shapelayer;
//中心点坐标
@property(nonatomic)CGPoint point;
//半径，底层半径，上层半径，中间层半径
@property(nonatomic)float bj;
//温度计宽度，线的宽度
@property(nonatomic)float sc_kd;

@end
