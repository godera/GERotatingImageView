//
//  GERotatigImageView.h
//  kissme
//
//  Created by sunyanliang on 13-9-27.
//  Copyright (c) 2013年 赵岩. All rights reserved.
//
/* ARC */
#import <UIKit/UIKit.h>

@interface GERotatingImageView : UIView

@property (assign, nonatomic) CGFloat progress;
@property (retain, nonatomic) UIImage* image;

-(void)start;
-(void)stop;

@end
