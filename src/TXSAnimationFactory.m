//
//  TXSAnimationFactory.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/2.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXSAnimationFactory.h"
#import <QuartzCore/QuartzCore.h>

@interface TXSAnimationFactory ()
-(CAAnimation*)groupWithAnimation:(NSArray*)animations duration:(NSTimeInterval)duration view:(UIView*)view name:(NSString*)name type:(NSString*)type;
-(CGPoint) outOfBoundsCenterForView:(UIView*)view direction:(TXSAnimationDirection)direction boundaryFrame:(CGRect)boundaryFrame;
-(CGPoint) bounceCenterForView:(UIView*)view direction:(TXSAnimationDirection)direction;

@end

#define DEGREES_TO_RADIANS(degrees) (degrees*M_PI/180.0f)

NSString* const kTXSAnimationKeyView=@"kTXSAnimationKeyView";
NSString* const kTXSAnimationKeyName=@"kTXSAnimationKeyName";
NSString* const kTXSAnimationKeyType=@"kTXSAnimationKeyType";
NSString* const kTXSAnimationKeyDelegate=@"kTXSAnimationKeyDelegate";
NSString* const kTXSAnimationKeyStartSelector =@"kTXSAnimationKeyStartSelector";
NSString* const kTXSAnimationKeyStopSelector=@"kTXSAnimationKeyStopSelector";

NSString* const kTXSAnimationTypeIn=@"kTXSAnimationTypeIn";
NSString* const kTXSAnimationTypeOut=@"kTXSAnimationTypeOut";
NSString* const kTXSAnimationTypeActive=@"kTXSAnimationTypeActive";

NSString* const  kTXSAnimationFadeIn=@"kTXSAnimationFadeIn";
NSString* const  kTXSAnimationFadeOut=@"kTXSAnimationFadeOut";
NSString* const  kTXSAnimationDropIn=@"kTXSAnimationDropIn";
NSString* const  kTXSAnimationDropOut=@"kTXSAnimationDropOut";
NSString* const  kTXSAnimationScale = @"kTXSAnimationScale";
NSString* const  kTXSAnimationRotate = @"kTXSAnimationRotate";
NSString* const kTXSAnimationSwirlIn=@"kTXSAnimationSwirlIn";
NSString* const kTXSAnimationSwirlOut=@"kTXSAnimationSwirlOut";
NSString* const kTXSAnimationSlideIn=@"kTXSAnimationSlideIn";
NSString* const  kTXSAnimationSlideOut=@"kTXSAnimationSlideOut";
NSString* const kTXSAnimationPulse=@"kTXSAnimationPulse";
NSString* const kTXSAnimationBounceIn=@"kTXSAnimationBounceIn";
NSString* const kTXSAnimationBounceOut=@"kTXSAnimationBounceOut";
NSString* const kTXSAnimationBounce=@"kTXSAnimationBounce";
NSString* const kTXSAnimationWiggle=@"kTXSAnimationWiggle";
NSString* const kTXSAnimationMoveTo=@"kTXSAnimationMoveTo";


@implementation TXSAnimationFactory
+(TXSAnimationFactory*) sharedInstance
{
    static TXSAnimationFactory* sharedInstance=nil;
    
    @synchronized(self)
    {
        if(!sharedInstance)
        {
            sharedInstance=[[TXSAnimationFactory alloc] init];
        }
    }
    
    return sharedInstance;
}

-(CGPoint) bounceCenterForView:(UIView *)view direction:(TXSAnimationDirection)direction
{
    float bounceOffset =10.0f;
    if (direction==kTXSAnimationLeft) {
        return CGPointMake(view.center.x+bounceOffset, view.center.y);
    }
    else if (direction==kTXSAnimationRight)
    {
        return CGPointMake(view.center.x-bounceOffset, view.center.y);
    }
    else if (direction==kTXSAnimationTop)
    {
        return CGPointMake(view.center.x, view.center.y+bounceOffset);
    }
    else if (direction==kTXSAnimationBottom)
    {
        return CGPointMake(view.center.x, view.center.y-bounceOffset);
    }
    else if(direction==kTXSAnimationTopLeft)
    {
        return CGPointMake(view.center.x+bounceOffset, view.center.y+bounceOffset);
    }
    else if (direction==kTXSAnimationTopRight)
    {
        return CGPointMake(view.center.x-bounceOffset, view.center.y+bounceOffset);
    }
    else if (direction==kTXSAnimationBottomLeft)
    {
        return CGPointMake(view.center.x+bounceOffset, view.center.y-bounceOffset);
    }
    else if (direction==kTXSAnimationBottomRight)
    {
        return CGPointMake(view.center.x-bounceOffset, view.center.y-bounceOffset);
    }
    return CGPointZero;
}

-(CGPoint) outOfBoundsCenterForView:(UIView *)view direction:(TXSAnimationDirection)direction boundaryFrame:(CGRect)boundaryFrame
{
    if (direction==kTXSAnimationLeft) {
        return CGPointMake(boundaryFrame.origin.x-(view.bounds.size.width/2.0f), view.center.y);
    }
    else if (direction==kTXSAnimationRight)
    {
        return CGPointMake(boundaryFrame.origin.x+boundaryFrame.size.width+(view.bounds.size.width/2.0f), view.center.y);
    }
    else if (direction==kTXSAnimationTop)
    {
        return CGPointMake(view.center.x, boundaryFrame.origin.y-(view.bounds.size.height/2.0f));
    }
    else if (direction==kTXSAnimationBottom)
    {
        return CGPointMake(view.center.x, boundaryFrame.origin.y+boundaryFrame.size.height+(view.bounds.size.height/2.0f));
    }
    else if (direction==kTXSAnimationTopLeft)
    {
        return CGPointMake(boundaryFrame.origin.x-(view.bounds.size.width/2.0f), boundaryFrame.origin.y-(view.bounds.size.height/2.0f));
    }
    else if (direction==kTXSAnimationTopRight)
    {
        return CGPointMake(boundaryFrame.origin.x+boundaryFrame.size.width+(view.bounds.size.width/2.0f), boundaryFrame.origin.y-(view.bounds.size.height/2.0f));
    }
    else if (direction==kTXSAnimationBottomLeft)
    {
        return CGPointMake(boundaryFrame.origin.x-(view.bounds.size.width/2.0f), boundaryFrame.origin.y+boundaryFrame.size.height+(view.bounds.size.height/2.0f));
    }
    else if (direction==kTXSAnimationBottomRight)
    {
        return CGPointMake(boundaryFrame.origin.x+boundaryFrame.size.width+(view.bounds.size.width/2.0f), boundaryFrame.origin.y+boundaryFrame.size.height+(view.bounds.size.height/2.0f));
    }
    return CGPointZero;
}

-(CAAnimation*) groupWithAnimation:(NSArray *)animations duration:(NSTimeInterval)duration view:(UIView *)view name:(NSString *)name type:(NSString *)type
{
    CAAnimationGroup* group=[CAAnimationGroup animation];
    
    group.animations=[NSArray arrayWithArray:animations];
    
    group.duration=duration;
    group.removedOnCompletion=NO;
    group.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.fillMode=kCAFillModeBoth;
    group.delegate=self;
    
    [group setValue:view forKey:kTXSAnimationKeyView];
    [group setValue:name forKey:kTXSAnimationKeyName];
    [group setValue:type forKey:kTXSAnimationKeyType];
    
    return group;
}

-(CAAnimation*)fadeIn:(UIView *)view duration:(NSTimeInterval)duration
{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    [animation setValue:kTXSAnimationFadeIn forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeIn forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSNumber numberWithFloat:0.0f];
    animation.toValue=[NSNumber numberWithFloat:1.0f];
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*)fadeIn:(UIView *)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[self fadeIn:view duration:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return  animation;
}

-(CAAnimation*)fadeout:(UIView *)view duration:(NSTimeInterval)duration
{
    CABasicAnimation* animation=[CABasicAnimation animationWithKeyPath:@"opactiy"];
    
    [animation setValue:kTXSAnimationFadeOut forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeOut forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSNumber numberWithFloat:1.0f];
    animation.toValue=[NSNumber numberWithFloat:0.0f];
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*)fadeout:(UIView *)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[self fadeout:view duration:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return animation;
}

-(CAAnimation*) slideIn:(UIView *)view direction:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration
{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    [animation setValue:kTXSAnimationSlideIn forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeIn forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSValue valueWithCGPoint:[self outOfBoundsCenterForView:view direction:direction boundaryFrame:boundaryView.bounds]];
    animation.toValue=[NSValue valueWithCGPoint:view.center];
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return animation;
}
-(CAAnimation*) slideIn:(UIView *)view direction:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation =[self slideIn:view direction:direction boundaryView:boundaryView duration:duration];
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return animation;
}

-(CAAnimation*) slideOut:(UIView *)view direction:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration
{
    CABasicAnimation* animation=[CABasicAnimation animationWithKeyPath:@"position"];
    
    [animation setValue:kTXSAnimationSlideOut forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeOut forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSValue valueWithCGPoint:view.center];
    animation.toValue=[NSValue valueWithCGPoint:[self outOfBoundsCenterForView:view direction:direction boundaryFrame:boundaryView.bounds]];
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*) slideOut:(UIView *)view direction:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[self slideOut:view direction:direction boundaryView:boundaryView duration:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return animation;
}

-(CAAnimation*) bounceIn:(UIView *)view directon:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration
{
    CAKeyframeAnimation* animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    [animation setValue:kTXSAnimationBounceIn forKey:kTXSAnimationKeyName];
    [animation setValue:view  forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeIn forKey:kTXSAnimationKeyType];
    
    UIBezierPath* path =[UIBezierPath bezierPath];
    [path moveToPoint:[self outOfBoundsCenterForView:view direction:direction boundaryFrame:boundaryView.bounds]];
    [path addLineToPoint:[self bounceCenterForView:view direction:direction]];
    [path moveToPoint:view.center];
    
    animation.path=path.CGPath;
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*)bounceIn:(UIView *)view diretion:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation =[self bounceIn:view directon:direction boundaryView:boundaryView duration:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return animation;
}

-(CAAnimation*) bounceOut:(UIView *)view directon:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration
{
    CAKeyframeAnimation* animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
 
    [animation setValue:kTXSAnimationBounceOut forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeOut forKey:kTXSAnimationKeyType];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:view.center];
    [path addLineToPoint:[self bounceCenterForView:view direction:direction]];
    [path addLineToPoint:[self outOfBoundsCenterForView:view direction:direction boundaryFrame:boundaryView.bounds]];
    
    animation.path=path.CGPath;
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate=self;
    
    return animation;
};

-(CAAnimation*) bounceOut:(UIView *)view diretion:(TXSAnimationDirection)direction boundaryView:(UIView *)boundaryView duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation = [self bounceOut:view directon:direction boundaryView:boundaryView duration:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyStopSelector];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return animation;
}

-( CAAnimation*) dropIn:(UIView *)view duration:(NSTimeInterval)duration
{
    CAAnimation* fadeAnim=[self fadeIn:view duration:duration];
    CAAnimation* scaleAnim=[self scale:view from:2.0f to:1.0f duration:duration];
    
    return [self groupWithAnimation:[NSArray arrayWithObjects:fadeAnim,scaleAnim,nil]  duration:duration view:view name:kTXSAnimationDropIn type:kTXSAnimationTypeIn];
}

-(CAAnimation*) dropIn:(UIView *)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation= [self dropIn:view  duration:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return animation;
}

-(CAAnimation*) dropOut:(UIView *)view duration:(NSTimeInterval)duration
{
    CAAnimation* fadeAnim=[self fadeout:view duration:duration];
    CAAnimation* scaleAnim=[self scale:view from:1.0f to:0.01f duration:duration];
    
    return [self groupWithAnimation:[NSArray arrayWithObjects:fadeAnim,scaleAnim, nil]  duration:duration view:view name:kTXSAnimationDropOut type:kTXSAnimationTypeOut];
}

-(CAAnimation*) dropOut:(UIView *)view duration:(NSTimeInterval)duration delegate:(id)delegate startSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[self dropOut:view duration:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return animation;
}

-(CAAnimation*) swirlIn:(UIView *)view duration:(NSTimeInterval)duration
{
    CAAnimation* rotateAnim = [self rotate:view duration:duration];
    CAAnimation* scaleAnim=[self scale:view from:0.01f to:0.1f duration:duration];
    
    return [self groupWithAnimation:[NSArray arrayWithObjects:rotateAnim,scaleAnim,nil] duration:duration view:view name:kTXSAnimationSwirlIn type:kTXSAnimationTypeIn];
}

-(CAAnimation*) swirlIn:(UIView *)view duration:(NSTimeInterval)duration delegate:(id)delegate statrSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[self swirlIn:view duratoin:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    
    return animation;
}

-(CAAnimation*) swirlOut:(UIView *)view duratoin:(NSTimeInterval)duration
{
    CAAnimation* rotateAnim=[self rotate:view duration:duration];
    CAAnimation* scaleAnim=[self scale:view from:1.0f to:0.01f duration:duration];
    return [self groupWithAnimation:[NSArray arrayWithObjects:rotateAnim,scaleAnim, nil] duration:duration view:view name:kTXSAnimationSwirlOut type:kTXSAnimationTypeOut];
}

-(CAAnimation*) swirlOut:(UIView *)view duration:(NSTimeInterval)duration delegate:(id)delegate statrSelector:(SEL)startSelector stopSelector:(SEL)stopSelector
{
    CAAnimation* animation=[self swirlOut:view duratoin:duration];
    
    [animation setValue:delegate forKey:kTXSAnimationKeyDelegate];
    [animation setValue:NSStringFromSelector(startSelector) forKey:kTXSAnimationKeyStartSelector];
    [animation setValue:NSStringFromSelector(stopSelector) forKey:kTXSAnimationKeyStopSelector];
    return animation;
}

-(CAAnimation*) rotate:(UIView *)view spinDirection:(TXSAnimationSpinDirection)spinDirection timePerSpin:(NSTimeInterval)timePerSpin
{
    CABasicAnimation* animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];

    [animation setValue:kTXSAnimationRotate forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeActive forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSNumber numberWithFloat:0.0f];
    
    if (spinDirection==kTXSAnimationSpinClockwise) {
        animation.toValue=[NSNumber numberWithFloat:2.0f*M_PI];
    } else {
        animation.toValue=[NSNumber numberWithFloat:-2.0f*M_PI];
    }
    
    animation.duration=timePerSpin;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeBoth;
    animation.repeatCount=HUGE_VALF;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*) bounce:(UIView *)view height:(float)height
{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"postion"];
    
    [animation setValue:kTXSAnimationBounce forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeActive forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)];
    animation.toValue=[NSValue valueWithCGPoint:CGPointMake(view.center.x,view.center.y-height)];
    animation.duration=0.6f;
    animation.removedOnCompletion=NO;
    animation.autoreverses=YES;
    animation.repeatCount=HUGE_VALF;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*) pulse:(UIView *)view minScale:(float)minScale maxScale:(float)maxScale
{
    CABasicAnimation* animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    [animation setValue:kTXSAnimationPulse forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeActive forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSNumber numberWithFloat:minScale];
    animation.toValue=[NSNumber numberWithFloat:maxScale];
    animation.duration=0.4f;
    animation.removedOnCompletion=NO;
    animation.autoreverses=YES;
    animation.repeatCount=HUGE_VALF;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*) scale:(UIView *)view from:(float)from to:(float)to duration:(NSTimeInterval)duration
{
    CABasicAnimation* animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    [animation setValue:kTXSAnimationScale forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeActive forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSNumber numberWithFloat:from];
    animation.toValue=[NSNumber numberWithFloat:to];
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*) rotate:(UIView *)view duration:(NSTimeInterval)duration
{
    CABasicAnimation* animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animation setValue:kTXSAnimationRotate forKey:kTXSAnimationKeyName ];
    [animation setValue:view  forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeActive forKey:kTXSAnimationKeyType];
    
    animation.fromValue=[NSNumber numberWithFloat:0.0f];
    animation.toValue=[NSNumber numberWithFloat:2.0f*M_PI];
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeBoth;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animation.delegate=self;
    
    return animation;
}

-(CAAnimation*) wiggle:(UIView *)view maxDegrees:(float)degrees maxTraslation:(float)translation
{
    float animDuration=0.16f;
    CABasicAnimation* rotateLeftRight=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [rotateLeftRight setValue:@"rotateLeftRight" forKey:kTXSAnimationKeyName];
    [rotateLeftRight setValue:view forKey:kTXSAnimationKeyView];
    [rotateLeftRight setValue:kTXSAnimationTypeActive forKey:kTXSAnimationKeyType];
    
    rotateLeftRight.fromValue=[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-degrees)];
    rotateLeftRight.toValue=[NSNumber numberWithFloat:DEGREES_TO_RADIANS(degrees)];
    rotateLeftRight.duration=animDuration;
    rotateLeftRight.removedOnCompletion=NO;
    rotateLeftRight.autoreverses=YES;
    rotateLeftRight.repeatCount=HUGE_VALF;
    rotateLeftRight.fillMode=kCAFillModeBoth;
    rotateLeftRight.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotateLeftRight.delegate=self;
    
    CABasicAnimation* upDown=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    [upDown setValue:@"upDown" forKey:kTXSAnimationKeyName];
    [upDown setValue:view  forKey:kTXSAnimationKeyView];
    [upDown setValue:kTXSAnimationTypeActive forKey:kTXSAnimationKeyType];
    
    upDown.fromValue=[NSNumber numberWithFloat:-translation];
    upDown.toValue=[NSNumber numberWithFloat:translation];
    upDown.duration=animDuration/2.0f;
    upDown.removedOnCompletion=NO;
    upDown.autoreverses=YES;
    upDown.repeatCount=HUGE_VALF;
    upDown.fillMode=kCAFillModeBoth;
    upDown.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    upDown.delegate=self;
    
    CAAnimation* anim=[self groupWithAnimation:[NSArray arrayWithObjects:rotateLeftRight,upDown,nil] duration:animDuration view:view name:kTXSAnimationWiggle type:kTXSAnimationTypeActive];
    
    anim.autoreverses=YES;
    anim.repeatCount=HUGE_VALF;
    
    return anim;
}

-(CAAnimation*) move:(UIView *)view to:(CGPoint)to duration:(NSTimeInterval)duration
{
    CABasicAnimation* animation=[CABasicAnimation animationWithKeyPath:@"position"];
    
    [animation setValue:kTXSAnimationMoveTo forKey:kTXSAnimationKeyName];
    [animation setValue:view forKey:kTXSAnimationKeyView];
    [animation setValue:kTXSAnimationTypeActive forKey:kTXSAnimationKeyType];
    
    animation.toValue=[NSValue valueWithCGPoint:to];
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate=self;
    animation.duration=duration;
    
    return animation;
}

-(CAAnimation*) moveFrom:(UIView *)view from:(CGPoint)from duration:(NSTimeInterval)duration
{
    return nil;
}

-(CAAnimation*) moveAlongPath:(UIView *)view moveAlongPath:(CGPoint)moveAlongPath duration:(NSTimeInterval)duration
{
    return nil;
}
-(void) animationDidStart:(CAAnimation *)anim
{
    UIView* view=[anim valueForKey:kTXSAnimationKeyView];
    NSString* animationType=[anim valueForKey:kTXSAnimationKeyType];
    
    if([animationType isEqualToString:kTXSAnimationTypeIn])
    {
        view.hidden=NO;
    }
    
    id animationDelegate=[anim valueForKey:kTXSAnimationKeyDelegate];
    NSString* animationStatSelector=[anim valueForKey:kTXSAnimationKeyStartSelector];
    
    if(animationDelegate)
    {
        SEL startSelector=NSSelectorFromString(animationStatSelector);
        
        if([animationDelegate respondsToSelector:startSelector])
        {
            [animationDelegate performSelector:startSelector withObject:anim withObject:view];
        }
    }
}

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    UIView* view=[anim valueForKey:kTXSAnimationKeyView];
    NSString* animationName=[anim valueForKey:kTXSAnimationKeyName];
    NSString* animationType=[anim valueForKey:kTXSAnimationKeyType];
    
    if ([animationType isEqualToString:kTXSAnimationTypeOut]) {
        view.hidden=YES;
    }
    
    [view.layer removeAnimationForKey:animationName];
    id animationDelegate=[anim valueForKey:kTXSAnimationKeyDelegate];
    NSString* animationStopSelector=[anim valueForKey:kTXSAnimationKeyStopSelector];
    
    if(animationDelegate)
    {
        SEL stopSelector=NSSelectorFromString(animationStopSelector);
        if ([animationDelegate respondsToSelector:stopSelector])
        {
            [animationDelegate performSelector:stopSelector withObject:anim withObject:view];
        }
    }
}

@end
