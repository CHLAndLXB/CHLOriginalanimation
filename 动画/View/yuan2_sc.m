//
//  ddd.m
//  2014621
//
//  Created by 孔凡群 on 14-7-1.
//  Copyright (c) 2014年 孔凡群. All rights reserved.
//

#import "yuan2_sc.h"

@implementation yuan2_sc

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    [self chushihua];
    return  self;
}

-(void)chushihua{
    
    _shapelayer = [CAShapeLayer layer];
    _shapelayer.fillColor = [[UIColor clearColor]CGColor];
    _shapelayer.strokeColor = [[UIColor redColor] CGColor];
    _shapelayer.backgroundColor = [[UIColor clearColor] CGColor];
    _shapelayer.lineJoin = kCALineJoinRound;
    _shapelayer.lineCap = kCALineCapRound;
    _shapelayer.frame = CGRectMake(0, 0, 0, 0);
    
}

-(void)setcanshu:(CGRect)rect{
    _bj = (rect.size.height>rect.size.width?rect.size.width/2:rect.size.height/2)-_sc_kd/2;
    _point = CGPointMake(rect.size.width/2, rect.size.height/2);
    if(_shapelayer.frame.origin.x==0||
       _shapelayer.frame.origin.y==0||
       _shapelayer.frame.size.width==0||
       _shapelayer.frame.size.height==0){
        
        _shapelayer.frame = rect;
        _shapelayer.lineWidth = _sc_kd;
        UIBezierPath * apath = [UIBezierPath bezierPath];
        [apath addArcWithCenter:_point radius:_bj startAngle:M_PI/2 endAngle:2*M_PI clockwise:YES];
        _shapelayer.path = apath.CGPath;
        _shapelayer.strokeEnd = 1;
        
        //为了旋转角度
        _shapelayer.transform = CATransform3DMakeRotation(M_PI/4, 0, 0, 1);

    }
}

-(void)drawRect:(CGRect)rect{
    [self setcanshu:rect];
    [self draw_mb];
}


-(void)draw_mb{
    [self.layer setMask:_shapelayer];
}
-(void)setSc_kd:(float)sc_kd{
    _sc_kd = sc_kd;
    [self setNeedsDisplay];
}
@end
