//
//  TXSADViewEx.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/4.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXSADViewEx.h"

@interface CustomADViewInfo : NSObject

@property(nonatomic,copy)NSString* text;
@property(nonatomic,copy)NSString* buttonText;
@property(nonatomic,copy)TXSADViewBlock buttonAction;

@end

@implementation CustomADViewInfo

@synthesize text;
@synthesize buttonText;
@synthesize buttonAction;

-(void)dealloc
{
    self.buttonAction=nil;
    
    [text release];
    [buttonText release];
    
    [super dealloc];
}

@end

@interface TXSADViewEx()

@property(nonatomic,retain) TXSADView* adView;
@property(nonatomic,copy) TXSADViewBlock dismissedBlock;
@property(nonatomic,copy) TXSADViewBlock customDismissedBlock;

@property(nonatomic,retain)NSMutableDictionary* pageContent;

@end

@implementation TXSADViewEx

@synthesize adView;
@synthesize dismissedBlock;
@synthesize customDismissedBlock;
@synthesize pageContent;
@synthesize maxHeight;
@synthesize adID;



+(TXSADViewEx*) infoADView
{
    __block TXSADViewEx* basicADView=[[[TXSADViewEx alloc] init] autorelease];
    
//    basicADView.adView.backgroundImage=[UIImage imageNamed:@"pattern2.jpg"];
    basicADView.adView.spanWidthWeight=1.0f;
    CGRect rect=[UIScreen mainScreen].bounds;
    [basicADView.adView setFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    basicADView.adView.presentationAnimation=kADViewPresentationSlide;
    basicADView.customDismissedBlock=^{
        [TXSADViewEx setHasDismissedAD:basicADView.adID];
    };
    return basicADView;
}

+(TXSADViewEx*) warningADView
{
    __block  TXSADViewEx* basicADView=[[[TXSADViewEx alloc] init] autorelease];
    basicADView.adView.backgroundColor=[UIColor colorWithRed:189.0/255.0 green:10/255.0 blue:5/255.0 alpha:0.9];
    basicADView.adView.spanWidthWeight=0.95;
    basicADView.adView.presentationAnimation=kADViewPresentationBounce;

    return basicADView;
}

+(TXSADViewEx*) otherADView
{
    __block TXSADViewEx* basicADView=[[[TXSADViewEx alloc] init] autorelease ];
    basicADView.adView.backgroundColor=[UIColor colorWithRed:89.0/255.0 green:119.0/255.0 blue:39.0/255.0 alpha:0.9];
    basicADView.adView.spanWidthWeight=0.95f;
    basicADView.adView.presentationAnimation=kADViewPresentationFade;
    
    return basicADView;
}

+(TXSADViewEx*)webADView
{
    __block TXSADViewEx* basicADView=[[[TXSADViewEx alloc] init] autorelease];
    
    //    basicADView.adView.backgroundImage=[UIImage imageNamed:@"pattern2.jpg"];
    CGRect rect=[UIScreen mainScreen].bounds;
    basicADView.adView.spanWidthWeight=1.0f;
    [basicADView.adView setFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    basicADView.adView.presentationAnimation=kADViewPresentationSlide;
    basicADView.customDismissedBlock=^{
        [TXSADViewEx setHasDismissedAD:basicADView.adID];
    };
    return basicADView;
}

+(TXSADViewEx*)videoADView
{
    __block TXSADViewEx* basicADView=[[[TXSADViewEx alloc] init] autorelease];
    
    //    basicADView.adView.backgroundImage=[UIImage imageNamed:@"pattern2.jpg"];
    CGRect rect=[UIScreen mainScreen].bounds;
    basicADView.adView.spanWidthWeight=1.0f;
    [basicADView.adView setFrame:CGRectMake(0, 0, rect.size.width, 200)];
    basicADView.adView.presentationAnimation=kADViewPresentationSlide;
    basicADView.customDismissedBlock=^{
        [TXSADViewEx setHasDismissedAD:basicADView.adID];
    };
    return basicADView;
}

+(void) setHasDismissedAD:(NSUInteger)adType
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[NSString stringWithFormat:@"ad.seen.%lu",(unsigned long)adType]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(BOOL) shouldShowAD:(NSUInteger)adID
{
    if(![TXSADViewEx adsEnabled])
    {
        return NO;
    }
    return ![[NSUserDefaults standardUserDefaults] boolForKey:[NSString stringWithFormat:@"ad.seen.%lu",(unsigned long)adID]];
}

+(void) resetAllADs
{
    for (NSUInteger adID=kADID_First; adID<kADID_Last; adID++) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithFormat:@"ad.seen.%lu",(unsigned long)adID]];
    }
}

+(void)enableADs:(BOOL)enable
{
    [[NSUserDefaults standardUserDefaults] setBool:enable forKey:@"ADEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(BOOL)adsEnabled
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"ADEnabled"];
}

+(BOOL) isADVisibleView:(UIView *)view
{
    for(UIView* subview in view.subviews)
    {
        if([subview isKindOfClass:[TXSADView class]])
        {
            return YES;
        }
    }
    return NO;
}

+(void) dismissVisibleADInView:(UIView *)view
{
    for (UIView* subview in view.subviews) {
        if([subview isKindOfClass:[TXSADView class]])
        {
            TXSADView* adView=(TXSADView*)subview;
            [adView dismiss];
        }
    }
}

-(id)init
{
    self=[super init];
    if (self) {
        self.adView=[[[TXSADView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
        
        self.adView.dataSource=self;
        self.adView.delegate=self;
        
        self.pageContent=[NSMutableDictionary dictionaryWithCapacity:10];
    }
    return self;
}

-(void)dealloc
{
    self.dismissedBlock=nil;
    self.customDismissedBlock=nil;
    
    [adView release];
    [pageContent release];
    
    [super dealloc];
}

-(void)addPageWithImage:(UIImage *)image
{
    NSNumber* pageNumber=[NSNumber numberWithInt:self.pageContent.count];
    
    [self.pageContent setObject:image forKey:pageNumber];
}

-(void)addPageWithView:(UIView *)view
{
    NSNumber* pageNumber=[NSNumber numberWithInt:self.pageContent.count];
    
    [self.pageContent setObject:view forKey:pageNumber];
}

-(void)setDismissedHandler:(TXSADViewBlock)dismissed
{
    self.dismissedBlock=dismissed;
}

-(void)showInView:(UIView *)view
{
    [self showInView:view orientation:kADViewOrientationBottom];
}

-(void)showInView:(UIView *)view orientation:(TXSADViewOrientation)orientation
{
    self.adView.orientation=orientation;
    
    [self retain];
    
    [view addSubview:self.adView];
    [view bringSubviewToFront:adView];
    
    [self.adView show];
}

-(void)showInView:(UIView *)view duration:(NSTimeInterval)duration
{
    [self showInView:view orientation:kADViewOrientationBottom duration:duration];
}

-(void)showInView:(UIView *)view orientation:(TXSADViewOrientation)orientation duration:(NSTimeInterval)duration
{
    self.adView.orientation=orientation;
    
    [self retain];
   
    [view addSubview:self.adView];
    [view bringSubviewToFront:self.adView];
    
    [self.adView show:duration];
}

-(void)showInView:(UIView *)view presentation:(TXSADViewPresentationAnimation)presentation
{
    [self showInView:view orientation:kADViewOrientationBottom presentation:presentation];
}

-(void)showInView:(UIView *)view orientation:(TXSADViewOrientation)orientation presentation:(TXSADViewPresentationAnimation)presentation
{
    self.adView.orientation=orientation;
    self.adView.presentationAnimation=presentation;
    
    [self retain];
    
    [view addSubview:self.adView];
    [view bringSubviewToFront:self.adView];
    
    [self.adView show];
}

-(void)showInView:(UIView *)view duration:(NSTimeInterval)duration presentation:(TXSADViewPresentationAnimation)presentation
{
    
}
-(void)showInView:(UIView *)view orientation:(TXSADViewOrientation)orientation duration:(NSTimeInterval)duration presentation:(TXSADViewPresentationAnimation)presentation
{
    self.adView.orientation=orientation;
    self.adView.presentationAnimation=presentation;
    
    [self  retain];
    
    [view addSubview:self.adView];
    [view bringSubviewToFront:self.adView];
    
    [self.adView show:duration];
}

-(NSInteger)numberOfPagesInADView:(TXSADView *)adView
{
    return self.pageContent.count;
}

-(UIImage*)imageForPage:(NSUInteger)page adView:(TXSADView *)adView
{
    id content=[self.pageContent objectForKey:[NSNumber numberWithInt:page]];
    
    if(!content||![content isKindOfClass:[UIImage class]])
    {
        return nil;
    }
    
    return content;
}

-(UIView*)viewForPage:(NSUInteger)page adView:(TXSADView *)adView

{
    id content=[self.pageContent objectForKey:[NSNumber numberWithInt:page]];
    
    if (!content||![content isKindOfClass:[UIView class]]) {
        return nil;
    }
    
    return content;
}

-(void)triggerButtonAction:(id)sender
{
    UIButton* button=(UIButton*)sender;
    
    CustomADViewInfo* customADViewInfo=[self.pageContent objectForKey:[NSNumber numberWithInt:button.tag]];
    customADViewInfo.buttonAction();
}

-(void) dismissedADView:(TXSADView *)adView
{
    if(self.customDismissedBlock)
    {
        self.customDismissedBlock();
    }
    if(self.dismissedBlock)
    {
        self.dismissedBlock();
    }
    [self autorelease];
}

-(void)dismiss
{
    [self.adView dismiss];
}
@end
