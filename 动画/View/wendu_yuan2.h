//
//  wendu_yuan2.h
//  2014621
//
//  Created by 孔凡群 on 14-6-30.
//  Copyright (c) 2014年 孔凡群. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "yuan2_sc.h"
#import "yuan2_zj.h"
@interface wendu_yuan2 : UIView

//温度计宽度，线的宽度
@property(nonatomic)float kd;
//zhi
@property(nonatomic)float z;

@property(nonatomic)yuan2_sc * sc;

@property(nonatomic)yuan2_zj * zj;

@property (nonatomic)float progress;
-(void)start;
@end
