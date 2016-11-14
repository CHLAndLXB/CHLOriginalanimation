//
//  yuan2_dt.m
//  2014621
//
//  Created by 孔凡群 on 14-7-1.
//  Copyright (c) 2014年 孔凡群. All rights reserved.
//

#import "yuan2_zj.h"
#import "UIColor+Hex.h"
@implementation yuan2_zj

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self chushihua];
    return self;
}
-(void)chushihua{
    _zj_kd = 20;
    _gradientlayer1 = [CAGradientLayer layer];
    _gradientlayer2 = [CAGradientLayer layer];
    
    //渐变范围
    _gradientlayer1.startPoint = CGPointMake(0, 0);
    _gradientlayer1.endPoint = CGPointMake(0, 1);
    _gradientlayer2.startPoint = CGPointMake(1, 0);
    _gradientlayer2.endPoint = CGPointMake(1, 1);
    
    
     _array1 = [NSArray arrayWithObjects:(id)[[UIColor colorWithHex:0xabfd49] CGColor],(id)[[UIColor colorWithHex:0xfbfb3b] CGColor],(id)[[UIColor colorWithHex:0xfc683a] CGColor], nil];
      _array2 = [NSArray arrayWithObjects:(id)[[UIColor colorWithHex:0xabfd49]  CGColor],(id)[[UIColor colorWithHex:0x0bb72b] CGColor], nil];
    _gradientlayer1.locations = @[@(0.1),@(0.3),@(0.6)];

    //渐变开始
    _gradientlayer1.colors = _array1;
    _gradientlayer2.colors = _array2;
    
    //将渐变层合并一个层，方便控制
    _layer_d = [CALayer layer];
    [_layer_d insertSublayer:_gradientlayer1 atIndex:0];
    [_layer_d insertSublayer:_gradientlayer2 atIndex:0];
    
   
    //设置蒙板
    _shapelayer = [CAShapeLayer layer];
    
    _shapelayer.fillColor = [[UIColor clearColor]CGColor];
    _shapelayer.strokeColor = [[UIColor redColor] CGColor];
    _shapelayer.backgroundColor = [[UIColor clearColor] CGColor];
    _shapelayer.lineJoin = kCALineJoinRound;
    _shapelayer.lineCap = kCALineCapRound;
    _shapelayer.frame = CGRectMake(0, 0, 0, 0);
    
    
    

}
-(void)setcanshu:(CGRect)rect{
    _bj = (rect.size.height>rect.size.width?rect.size.width/2:rect.size.height/2)-_zj_kd/2;
    _point = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    _rect1 = CGRectMake(rect.size.width/2-_bj-_zj_kd/2, rect.size.height/2-_bj-_zj_kd/2, _bj+_zj_kd/2, 2*_bj+_zj_kd);
    _rect2 = CGRectMake(rect.size.width/2,rect.size.height/2-_bj-_zj_kd/2,_bj+_zj_kd/2, 2*_bj+_zj_kd);
    
    _gradientlayer1.frame = _rect1;
    _gradientlayer2.frame = _rect2;
    
    _layer_d.frame = rect;
    _shapelayer.lineWidth = _zj_kd;
    _apath = [UIBezierPath bezierPath];
    [_apath addArcWithCenter:_point radius:_bj-2 startAngle:M_PI*2.95/4 endAngle:M_PI*1.05/4 clockwise:YES];


    _shapelayer.path = _apath.CGPath;
    if(_z>_z1){
        _z1 = 0.001+_z>0.999?1:0.001+_z;
    }else {
        _z1 = 0.001+_z<0?0.001:0.001+_z;
    }
    _shapelayer.strokeEnd =_z1;
  
    [self addBackgroundCircle];

    [_layer_d setMask:_shapelayer];
    [self.layer addSublayer:_layer_d];
    
}

-(void)addBackgroundCircle
{
    CAShapeLayer *backgrounLayer = [CAShapeLayer layer];
    backgrounLayer.lineJoin = kCALineJoinRound;
    backgrounLayer.lineCap = kCALineCapRound;
    backgrounLayer.frame = CGRectMake(0, 0, 0, 0);
    UIBezierPath *pathT = [UIBezierPath bezierPath];
    [pathT addArcWithCenter:_point radius:_bj-2 startAngle:M_PI*2.95/4 endAngle:M_PI*1.05/4 clockwise:YES];
   
    backgrounLayer.path = pathT.CGPath;
    backgrounLayer.fillColor = [UIColor clearColor].CGColor;
    backgrounLayer.lineWidth = _zj_kd;
    backgrounLayer.strokeColor = [UIColor colorWithHex:0x0270af].CGColor;
    [self.layer addSublayer:backgrounLayer];
}
-(void)drawRect:(CGRect)rect{
    [self setcanshu:rect];
}

-(void)setZj_kd:(float)zj_kd{
    _zj_kd = zj_kd;
    [self setNeedsDisplay];
}
-(void)startAnimaition
{
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani.fromValue = @0.0;
    ani.toValue = [NSNumber numberWithFloat:self.toValue];
    ani.duration = 1.5;
    ani.fillMode=kCAFillModeForwards;
    ani.removedOnCompletion=NO;
    [_shapelayer addAnimation:ani forKey:nil];
}
@end
