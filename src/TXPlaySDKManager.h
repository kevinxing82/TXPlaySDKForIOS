//
//  TXPlaySDKMgr.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/2.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TXSADInfo.h"
@interface TXPlaySDKManager : NSObject
{
    NSString* barURL;
    NSString* nextBarURL;
    
    NSString* fullScreenURL;
    NSString* nextFullScreenURL;
    
    NSString* videoURL;
    NSString* nextVideoURL;
    
    NSString* innerWebURL;
    NSString* nextInnerWebURL;
    
    NSString* startupURL;
    NSString* nextStartupURL;
    UIView* barView;
}

+(TXPlaySDKManager*)sharedInstance;

-(void)initWithNetwork;
-(void)showBarAd:(UIView*)view;
-(void)_showBarAD:(UIImage*) img;
-(void)showFullScreenAd:(UIView*)view;
-(void)showVideoAd:(UIView*)view;
-(void)showWallAd:(UIView*)view;
-(void)showStartupAd:(UIView*)view;
-(void)setData:(TXSADInfo*) info;

-(CGRect)getAppRect;
-(CGRect)getScreenRect;

@end

#define TXPlaySDKMgr [TXPlaySDKManager sharedInstance]
