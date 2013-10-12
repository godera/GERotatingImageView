//
//  GERotatigImageView.m
//  kissme
//
//  Created by sunyanliang on 13-9-27.
//  Copyright (c) 2013年 赵岩. All rights reserved.
//

#import "GERotatingImageView.h"

@interface GERotatingImageView ()
{
    CGFloat _angle;
    BOOL _canRestart;
}
@property (retain, nonatomic) UIImageView* imageView;
@property (retain, nonatomic) NSTimer* rotateTimer;

@end


@implementation GERotatingImageView

-(void)willMoveToWindow:(UIWindow *)newWindow
{
    if (newWindow == nil) // at the moment the method like viewWillDisappear in view controller
    {
        if (_isAnimating)
        {
            [self stop];
            _canRestart = YES;
        }
    }
    else // at the moment the method like viewWillAppear in view controller
    {
        if (_canRestart)
        {
            _canRestart = NO;
            [self start];
        }
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
        
        _angle = 0.0f;
        
        self.hidden = YES;
    }
    return self;
}

-(void)rotating:(NSTimer*)timer
{
    _angle += 0.1;
    if (_angle > M_PI*2.0) {
        _angle = 0.1;
    }
    _imageView.transform = CGAffineTransformMakeRotation(_angle);
}

-(void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}

-(UIImage *)image
{
    return self.imageView.image;
}

-(void)start
{
    if (_rotateTimer && [_rotateTimer isValid]) {
        [_rotateTimer invalidate];
    }
    
    self.hidden = NO;
    self.rotateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(rotating:) userInfo:nil repeats:YES];
    _isAnimating = YES;
}

-(void)stop
{
    self.hidden = YES;
    if (_rotateTimer && [_rotateTimer isValid]) {
        [_rotateTimer invalidate];
    }
    _isAnimating = NO;
}

@end









