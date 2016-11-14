//
//  wendu_yuan2.m
//  2014621
//
//  Created by 孔凡群 on 14-6-30.
//  Copyright (c) 2014年 孔凡群. All rights reserved.
//

#import "wendu_yuan2.h"
#import "yuan2_sc.h"
#import "yuan2_zj.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@implementation wendu_yuan2
//代码创建初始化
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setchushihua];
    return  self;
}

-(void)setchushihua{
    _kd = 10;
    _sc = [[yuan2_sc alloc]init];
    _sc.backgroundColor = [UIColor clearColor];
    _zj = [[yuan2_zj alloc]init];
    _zj.backgroundColor = [UIColor clearColor];
    _zj.toValue = self.progress;
    [self insertSubview:_zj atIndex:1];
    [self insertSubview:_sc atIndex:2];
}


//重绘方法
-(void)drawRect:(CGRect)rect{
    
    [self draw_scdcdt:rect];
}



//添加上层,中间层，底层
-(void)draw_scdcdt:(CGRect)rect{
        _sc.frame = rect;
        _zj.frame = rect;
        //宽度，值，宽度
        _sc.sc_kd = _kd+5;
        _zj.z = _z;
        _zj.zj_kd = _kd;

}



-(void)setKd:(float)kd{
    _kd = kd> 10?10:kd;
    [self setNeedsDisplay];
}
-(void)setZ:(float)z{
    _z = z;
    [self setNeedsDisplay];
}
-(void)setProgress:(float)progress
{
    _progress = progress;
    _zj.toValue = progress;
}
-(void)start
{
    [_zj startAnimaition];
}
@end
