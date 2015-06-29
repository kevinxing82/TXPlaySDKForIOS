//
//  TXSADSplashView.m
//  TXPlaySDKForIOS
//
//  Created by XingQian on 6/26/15.
//  Copyright (c) 2015 xingQian. All rights reserved.
//

#import "TXSADSplashView.h"
#import <UIKit/UIKit.h>

@implementation TXSADSplashView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(TXSADSplashView*)launch
{
    spalshView=[[UIImageView alloc]initWithFrame:self.frame];
    spalshView.image=[UIImage imageNamed:@"splashdemo.jpg"];
    [self addSubview:spalshView];
    [self performSelector:@selector(countdownAnimation) withObject:nil afterDelay:5];
    return self;
}

-(void)countdownAnimation
{
    CATransition* animation=[CATransition animation];
    animation.delegate=self;
    animation.duration=0.7;
    animation.timingFunction=UIViewAnimationCurveEaseInOut;
    animation.type=kCATransitionFade;
    
    [[self layer] addAnimation:animation forKey:@"animation"];
    
    [self performSelector:@selector(dispearAnimation) withObject:nil afterDelay:2];
}

-(void)dispearAnimation
{
    [self removeFromSuperview];
}


@end
