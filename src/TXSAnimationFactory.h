//
//  TXSAnimationFactory.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/2.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum _TXSAnimationDirection{
    kTXSAnimationTop=0,
    kTXSAnimationRight,
    kTXSAnimationBottom,
    kTXSAnimationLeft,
    kTXSAnimationTopLeft,
    kTXSAnimationTopRight,
    kTXSAnimationBottomLeft,
    kTXSAnimationBottomRight
} TXSAnimationDirection;

typedef  enum _TXSAnimationSpinDirection{
    kTXSAnimationSpinClockwise,
    kTXSAnimationSpinCounterClockwise
} TXSAnimationSpinDirection;

extern NSString* const kTXSAnimationKeyView;
extern NSString* const kTXSAnimationKeyName;
extern NSString* const kTXSAnimationKeyType;
extern NSString* const kTXSAnimationKeyDelegate;
extern NSString* const kTXSAnimationKeyStartSelector;
extern NSString* const kTXSAnimationKeyStopSelector;

extern NSString* const kTXSAnimationTypeIn;
extern NSString* const kTXSAnimationTypeOut;
extern NSString* const kTXSAnimationTypeActive;

extern NSString* const kTXSAnimationScale;
extern NSString* const kTXSAnimationRotate;
extern NSString* const kTXSAnimationPulse;
extern NSString* const kTXSAnimationBounce;
extern NSString* const kTXSAnimationWiggle;

extern NSString* const kTXSAnimationMoveTo;

extern NSString* const kTXSAnimationFadeIn;
extern NSString* const kTXSAnimationFadeOut;
extern NSString* const kTXSAnimationDropIn;
extern NSString* const kTXSAnimationDropOut;
extern NSString* const kTXSAnimationSwirlIn;
extern NSString* const kTXSAnimationSwirlOut;
extern NSString* const kTXSAnimationSlideIn;
extern NSString* const kTXSAnimationSlideOut;
extern NSString* const kTXSAnimationBounceIn;
extern NSString* const kTXSAnimationBounceOut;

@interface TXSAnimationFactory : NSObject

+(TXSAnimationFactory*) sharedInstance;

-(CAAnimation*)fadeIn:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*)fadeIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)fadeout:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*)fadeout:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)slideIn:(UIView*)view direction:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(CAAnimation*)slideIn:(UIView*)view direction:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)slideOut:(UIView*)view direction:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(CAAnimation*)slideOut:(UIView*)view direction:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)bounceIn:(UIView*)view directon:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(CAAnimation*)bounceIn:(UIView*)view diretion:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)bounceOut:(UIView*)view directon:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration;
-(CAAnimation*)bounceOut:(UIView*)view diretion:(TXSAnimationDirection)direction boundaryView:(UIView*)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)dropIn:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*)dropIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)dropOut:(UIView*)view duration:(NSTimeInterval)duration;
-(CAAnimation*)dropOut:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)swirlIn:(UIView*)view duratoin:(NSTimeInterval)duration;
-(CAAnimation*)swirlIn:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate statrSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)swirlOut:(UIView*)view duratoin:(NSTimeInterval)duration;
-(CAAnimation*)swirlOut:(UIView*)view duration:(NSTimeInterval)duration delegate:(id)delegate statrSelector:(SEL)startSelector stopSelector:(SEL)stopSelector;

-(CAAnimation*)move:(UIView*)view to:(CGPoint)to duration:(NSTimeInterval)duration;
-(CAAnimation*)moveFrom:(UIView*)view from:(CGPoint)from duration:(NSTimeInterval)duration;
-(CAAnimation*)moveAlongPath:(UIView*)view moveAlongPath:(CGPoint)moveAlongPath duration:(NSTimeInterval)duration;

-(CAAnimation*)scale:(UIView*)view from:(float)from to:(float)to duration:(NSTimeInterval)duration;
-(CAAnimation*)rotate:(UIView*)view duration:(NSTimeInterval)duration;

-(CAAnimation*)pulse:(UIView*)view minScale:(float)minScale maxScale:(float)maxScale;
-(CAAnimation*)bounce:(UIView*)view height:(float)height;
-(CAAnimation*)rotate:(UIView*)view spinDirection:(TXSAnimationSpinDirection)spinDirection timePerSpin:(NSTimeInterval)timePerSpin;
-(CAAnimation*)wiggle:(UIView*)view maxDegrees:(float)degrees maxTraslation:(float)translation;

@end

