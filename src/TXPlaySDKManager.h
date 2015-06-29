/**
 * @file    TXPlaySDKManager.h
 * @brief   SDK接口
 * @author   kevinxing
 * @version    1.0
 * @date    2015-06-17
 *
 * # update （更新日志）
 *
 * [2015-06-17]  <kevinxing> v1.0
 *
 * + v1.0版发布.
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TXSADInfo.h"
#import "TXSADSplashView.h"

/**
 *  @author XingQian, 15-06-17 13:06:39
 *
 *  @brief  天蝎互动SDK的接口类
 */
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

//    UIView*  view;
}

@property(nonatomic,assign)UIView* view;

/**
 *  @author XingQian, 15-06-17 13:06:42
 *
 *  @brief  获取TXPlaySDKManager的实例
 *
 *  @return TXPlaySDKManager的实例
 */
+(TXPlaySDKManager*)sharedInstance;

/**
 *  @author XingQian, 15-06-17 14:06:04
 *
 *  @brief 初始化的同时，进行网络数据请求
 */
-(void)initWithNetwork;
-(BOOL)isInitialized;

/**
 *  @author XingQian, 15-06-17 14:06:14
 *
 *  @brief  显示横幅广告
 *
 */
-(void)showBarAd;
-(void)showFullScreenAd;
-(void)showVideoAd;
-(void)showWallAd;
-(void)showStartupAd;
-(TXSADSplashView*)showSpalshScreen:(CGRect) frameSize;
-(void)setData:(TXSADInfo*) info;

-(CGRect)getAppRect;
-(CGRect)getScreenRect;

@end

#define TXPlaySDKMgr [TXPlaySDKManager sharedInstance]
