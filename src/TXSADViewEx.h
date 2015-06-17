//
//  TXSADViewDelegate.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/4.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXSADView.h"

typedef enum{
    kADID_Home=1,
    kADID_B,
    kADID_C,
    
    kADID_First=kADID_Home,
    kADID_Last=kADID_C
    
} ADID;

@interface TXSADViewEx : NSObject<TXSADViewDataSource,
TXSADVIewDelegate>

+(TXSADViewEx*) infoADView;
+(TXSADViewEx*) warningADView;
+(TXSADViewEx*) otherADView;
+(TXSADViewEx*)webADView;
+(TXSADViewEx*)videoADView;

typedef void (^TXSADViewBlock)();

@property (nonatomic,assign)NSUInteger maxHeight;
@property (nonatomic,assign) ADID adID;

+(void) setHasDismissedAD:(NSUInteger)adType;
+(BOOL) shouldShowAD:(NSUInteger)adID;
+(void) resetAllADs;

+(void) enableADs:(BOOL)enable;
+(BOOL) adsEnabled;

+(BOOL) isADVisibleView:(UIView*)view;
+(void) dismissVisibleADInView:(UIView*)view;

-(void)addPageWithImage:(UIImage*)image;
-(void)addPageWithView:(UIView*)view;

-(void) setDismissedHandler:(TXSADViewBlock)dismissed;

-(void)showInView:(UIView*)view;
-(void)showInView:(UIView*)view orientation:(TXSADViewOrientation)orientation;
-(void)showInView:(UIView*)view duration:(NSTimeInterval)duration;
-(void)showInView:(UIView*)view orientation:(TXSADViewOrientation)orientation duration:(NSTimeInterval)duration;
-(void)showInView:(UIView*)view presentation:(TXSADViewPresentationAnimation)presentation;
-(void)showInView:(UIView*)view orientation:(TXSADViewOrientation)orientation presentation:(TXSADViewPresentationAnimation)presentation;
-(void)showInView:(UIView*)view duration:(NSTimeInterval)duration presentation:(TXSADViewPresentationAnimation)presentation;
-(void)showInView:(UIView*)view orientation:(TXSADViewOrientation)orientation duration:(NSTimeInterval)duration presentation:(TXSADViewPresentationAnimation)presentation;

-(void) dismiss;

@end
