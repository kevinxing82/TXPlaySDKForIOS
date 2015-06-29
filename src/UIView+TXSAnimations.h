//
//  UIView+TXSAnimation.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/3.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "TXSAnimationFactory.h"


@interface UIView (TXSAnimations)

-(void) animationFadeInWithDuration:(NSTimeInterval)duration;
-(void) animationFadeInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationFadeOutWithDuration:(NSTimeInterval)duration;
-(void)animationFadeOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationDropInWithDuration:(NSTimeInterval)duration;
-(void)animationDropInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationDropOutWithDuration:(NSTimeInterval)duration;
-(void)animationDropOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationSwirlInWithDuration:(NSTimeInterval)duration;
-(void)animationSwirlInWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationSwirlOutWithDuration:(NSTimeInterval)duration;
-(void)animationSwirlOutWithDuration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationSlideInWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(void)animationSlideInWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationSlideOutWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(void)animationSlideOutWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationBounceInWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(void)animationBounceInWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationBounceOutWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(void)animationBounceOutWithDirection:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(void)animationStartPulseWithMinScale:(float)minScale maxScale:(float)maxScale;
-(void)animationStopPulse;

-(void)animationStartBounceWithHeight:(float)height;
-(void)animationstopBounce;

-(void)animationStartRotateWithTimePerSpin:(NSTimeInterval)timePerSpin spinDirection:(TXSAnimationSpinDirection)spinDirection;
-(void)animationStopRotate;

-(void)animationStartWiggle;
-(void)animationStopWiggle;

-(void)moveTo:(CGPoint)to duration:(NSTimeInterval)duration;
@end