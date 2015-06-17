//
//  TXSADView.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/15.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum _TXSADViewOrientation{
    kADViewOrientationTop,
    kADViewOrientationBottom,
    kADViewOrientationCenter,
} TXSADViewOrientation;

typedef enum _TXSADViewPresentationAnimation{
    kADViewPresentationFade,
    kADViewPresentationDrop,
    kADViewPresentationSwirl,
    kADViewPresentationSlide,
    kADViewPresentationBounce
} TXSADViewPresentationAnimation;

@protocol TXSADViewDataSource ;
@protocol TXSADVIewDelegate;

@interface TXSADView : UIView<UIScrollViewDelegate>

@property(nonatomic,assign)id<TXSADViewDataSource> dataSource;
@property(nonatomic,assign)id<TXSADVIewDelegate > delegate;
@property(nonatomic,assign)CGFloat spanWidthWeight;
@property(nonatomic,copy)  UIImage* backgroundImage;
@property(nonatomic,assign)TXSADViewPresentationAnimation presentationAnimation;
@property(nonatomic,assign)TXSADViewOrientation orientation;
@property(nonatomic,assign)CGFloat maximumHeight;

-(void) show;
-(void) show:(NSTimeInterval)duration;

-(void)dismiss;

@end

@protocol TXSADViewDataSource <NSObject>

@required
-(NSInteger) numberOfPagesInADView:(TXSADView*) adView;
@optional
-(UIView*) viewForPage:(NSUInteger) page adView:(TXSADView*)adView;
-(UIImage*) imageForPage:(NSUInteger)page adView:(TXSADView*)adView;

@end

@protocol TXSADVIewDelegate <NSObject>

@optional
-(void) dismissedADView:(TXSADView*) adView;
-(CGFloat) heightForADView:(TXSADView*)adView;

@end
