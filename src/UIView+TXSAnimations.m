//
//  UIView+TXSAnimation.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/3.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "UIView+TXSAnimations.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (TXSAnimations)

-(void)animationFadeInWithDuration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] fadeIn:self duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationFadeIn];
}

-(void)animationFadeInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] fadeIn:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
    [self.layer addAnimation:animation forKey:kTXSAnimationFadeIn];
}

-(void)animationFadeOutWithDuration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] fadeout:self duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationFadeOut];
}

-(void)animationFadeOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] fadeout:self  duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
    [self.layer addAnimation:animation forKey:kTXSAnimationFadeOut];
}

-(void)animationDropInWithDuration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] dropIn:self duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationDropIn];
}

-(void)animationDropInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] dropIn:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector ];
    [self.layer addAnimation:animation forKey:kTXSAnimationDropIn];
}

-(void)animationDropOutWithDuration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] dropOut:self duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationDropOut];
}

-(void)animationDropOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] dropOut:self duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
    [self.layer addAnimation:animation forKey:kTXSAnimationDropOut];
}

-(void)animationSwirlInWithDuration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] swirlIn:self duratoin:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationSwirlIn];
}

-(void)animationSwirlInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] swirlIn:self duration:duration delegate:delegate statrSelector:startSelector stopSelector:stopSelector];
    [self.layer addAnimation:animation forKey:kTXSAnimationSwirlIn];
}

-(void)animationSwirlOutWithDuration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] swirlOut:self  duratoin:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationSwirlOut];
}

-(void)animationSwirlOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] swirlOut:self duration:duration delegate:delegate statrSelector:startSelector stopSelector:stopSelector ];
    [self.layer addAnimation:animation forKey:kTXSAnimationSwirlOut];
}

-(void)animationSlideInWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] slideIn:self direction:direction boundaryView:boundaryView duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationSlideIn];
}

-(void)animationSlideInWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] slideIn:self direction:direction boundaryView:boundaryView duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
    [self.layer addAnimation:animation forKey:kTXSAnimationSlideIn];
}

-(void)animationSlideOutWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] slideOut:self direction:direction boundaryView:boundaryView duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationSlideOut];
}

-(void)animationSlideOutWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] slideOut:self direction:direction boundaryView:boundaryView duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
    [self.layer addAnimation:animation forKey:kTXSAnimationSlideOut];
}

-(void)animationBounceInWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] bounceIn:self directon:direction boundaryView:boundaryView duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationBounceIn];
}

-(void)animationBounceInWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] bounceIn:self diretion:direction boundaryView:boundaryView duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
    [self.layer addAnimation:animation forKey:kTXSAnimationBounceIn];
}

-(void)animationBounceOutWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] bounceOut:self directon:direction boundaryView:boundaryView duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationBounceOut];
}

-(void)animationBounceOutWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] bounceOut:self diretion:direction boundaryView:boundaryView duration:duration delegate:delegate startSelector:startSelector stopSelector:stopSelector];
    [self.layer addAnimation:animation forKey:kTXSAnimationBounceOut];
}

-(void)animationStartPulseWithMinScale:(float)minScale maxScale:(float)maxScale
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] pulse:self minScale:minScale maxScale:maxScale];
    [self.layer addAnimation:animation forKey:kTXSAnimationPulse];
}

-(void)animationStopPulse
{
    [self.layer removeAnimationForKey:kTXSAnimationPulse];
}

-(void)animationStartBounceWithHeight:(float)height
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] bounce:self height:height];
    [self.layer addAnimation:animation forKey:kTXSAnimationBounce];
}

-(void)animationstopBounce
{
    [self.layer removeAnimationForKey:kTXSAnimationBounce];
}

-(void)animationStartRotateWithTimePerSpin:(NSTimeInterval)timePerSpin spinDirection:(TXSAnimationSpinDirection)spinDirection
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] rotate:self spinDirection:spinDirection timePerSpin:timePerSpin];
    [self.layer addAnimation:animation forKey:kTXSAnimationRotate];
}

-(void)animationStopRotate
{
    [self.layer removeAnimationForKey:kTXSAnimationRotate];
}

-(void)animationStartWiggle
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] wiggle:self maxDegrees:2.0f maxTraslation:2.0f];
    [self.layer addAnimation:animation forKey:kTXSAnimationWiggle];
}

-(void)animationStopWiggle
{
    [self.layer removeAnimationForKey:kTXSAnimationWiggle];
}

-(void)moveTo:(CGPoint)to duration:(NSTimeInterval)duration
{
    CAAnimation* animation=[[TXSAnimationFactory sharedInstance] move:self to:to duration:duration];
    [self.layer addAnimation:animation forKey:kTXSAnimationMoveTo];
}

@end

