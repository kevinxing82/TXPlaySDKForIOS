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
@property(nonatomic,retain) TXSADView* adView;
@property (nonatomic,assign) ADID adID;

/**
 *  @author XingQian, 15-06-17 15:06:32
 *
 *  @brief 本地持久化已经关闭的广告类型
 *
 *  @param adType 广告的类型
 */
+(void) setHasDismissedAD:(NSUInteger)adType;

/**
 *  @author XingQian, 15-06-17 15:06:33
 *
 *  @brief  查询指定adID的广告是否可以显示
 *
 *  @param adID 需要查询的广告ID
 *
 *  @return 是否可以显示
 */
+(BOOL) shouldShowAD:(NSUInteger)adID;


/**
 *  @author XingQian, 15-06-17 15:06:19
 *
 *  @brief  重置所有的广告
 */
+(void) resetAllADs;

/**
 *  @author XingQian, 15-06-17 15:06:10
 *
 *  @brief  设置是否可广告
 *
 *  @param enable 是否可广告
 */
+(void) enableADs:(BOOL)enable;

/**
 *  @author XingQian, 15-06-17 15:06:14
 *
 *  @brief  获取是否可广告的标志位
 *
 *  @return 是否可广告的标志位的值
 */
+(BOOL) adsEnabled;

/**
 *  @author XingQian, 15-06-17 15:06:55
 *
 *  @brief  指定广告是否可见
 *
 *  @param view 指定的广告
 *
 *  @return 是否可见
 */
+(BOOL) isADVisibleView:(UIView*)view;

/**
 *  @author XingQian, 15-06-17 15:06:25
 *
 *  @brief  取消某个广告
 *
 *  @param view 指定的广告
 */
+(void) dismissVisibleADInView:(UIView*)view;

/**
 *  @author XingQian, 15-06-17 16:06:04
 *
 *  @brief   添加一个Image
 *
 *  @param image  被添加的对象
 */
-(void)addPageWithImage:(UIImage*)image;

/**
 *  @author XingQian, 15-06-17 16:06:04
 *
 *  @brief  添加一个UIView
 *
 *  @param view  被添加的UIView
 */
-(void)addPageWithView:(UIView*)view;

/**
 *  @author XingQian, 15-06-17 16:06:24
 *
 *  @brief  设置取消的回调用
 *
 *  @param dismissed 回调用的快
 */
-(void) setDismissedHandler:(TXSADViewBlock)dismissed;

/**
 *  @author XingQian, 15-06-17 16:06:12
 *
 *  @brief  在view上显示 adView
 *
 *  @param view  用来显示adView的容器
 */
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
