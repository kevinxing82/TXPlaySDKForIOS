//
//  TXSADView.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/15.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXSADView.h"
#import "UIView+TXSAnimations.h"
#import <QuartzCore/QuartzCore.h>

@interface TXSADView ()

@property(nonatomic,retain)UIButton* buttonDismiss;
@property(nonatomic,retain)UIPageControl* pageControl;
@property(nonatomic,retain)UIScrollView* scrollViewPages;
@property(nonatomic,retain)NSTimer* dismissTimer;
@property(atomic,assign)BOOL isDismssing;

@end

@implementation TXSADView

@synthesize dataSource;
@synthesize delegate;
@synthesize buttonDismiss;
@synthesize pageControl;
@synthesize scrollViewPages;
@synthesize backgroundImage;
@synthesize presentationAnimation;
@synthesize orientation;
@synthesize dismissTimer;
@synthesize isDismssing;
@synthesize spanWidthWeight;
@synthesize maximumHeight;

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.clipsToBounds=YES;
        self.userInteractionEnabled=YES;
        self.maximumHeight=160.0f;
        self.spanWidthWeight=1.0f;
        self.presentationAnimation=kADViewPresentationSlide;
        self.orientation=kADViewOrientationBottom;
    }
    return self;
}

-(void)dealloc
{
    self.dataSource=nil;
    self.delegate=nil;
    
    [buttonDismiss release];
    [pageControl release ];
    [scrollViewPages release];
    [dismissTimer release];
    
    [super dealloc];
}

-(void)createSubviews
{
    self.scrollViewPages.hidden=NO;
    self.pageControl.hidden=NO;
    self.buttonDismiss.hidden=NO;
}

#pragma mark -Getters

-(UIButton*) buttonDismiss
{
    if (!buttonDismiss) {
        CGFloat yOffset=0.0f;
        
        if (self.orientation==kADViewOrientationTop) {
            yOffset=40.0f;
        }
        else if (self.orientation==kADViewOrientationBottom)
        {
            yOffset=0.0f;
        }
        
        buttonDismiss=[[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-20, 5+yOffset, 16, 16)];
        buttonDismiss.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin;
        [buttonDismiss setImage:[UIImage imageNamed:@"closeBtn_black"] forState:UIControlStateNormal];
        [buttonDismiss addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttonDismiss];
    }
    return buttonDismiss;
}

-(UIPageControl*) pageControl
{
    if(!pageControl)
    {
        CGFloat yOffset=0.0f;
        
        if(self.orientation==kADViewOrientationTop)
        {
            yOffset=10.0f;
        }
        else if (self.orientation==kADViewOrientationBottom)
        {
            yOffset=0.0f;
        }
        
        pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, yOffset, self.frame.size.width, 36)];
        pageControl.autoresizingMask=UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        pageControl.hidesForSinglePage=NO;
        [pageControl setBackgroundColor:[UIColor greenColor]];
        
        [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:pageControl];
    }
    return pageControl;
}

-(UIScrollView*) scrollViewPages
{
    if (!scrollViewPages) {
        CGFloat yOffset=0.0f;
        
        if (self.orientation==kADViewOrientationTop) {
            yOffset=10.0f;
        }
        else if (self.orientation==kADViewOrientationBottom)
        {
            yOffset=0.0f;
        }
        scrollViewPages=[[UIScrollView alloc] initWithFrame:CGRectMake(0, yOffset, self.frame.size.width, self.frame.size.height)];
        scrollViewPages.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        scrollViewPages.backgroundColor=[UIColor clearColor];
        scrollViewPages.delegate=self;
        scrollViewPages.indicatorStyle=UIScrollViewIndicatorStyleWhite;
        scrollViewPages.userInteractionEnabled=YES;
        scrollViewPages.backgroundColor=[UIColor grayColor];
        
        [self addSubview:scrollViewPages];
    }
    return scrollViewPages;
}

-(void)show
{
    CGRect oldFrame=self.frame;
    CGRect screenSize=[UIScreen mainScreen].bounds;
//    self.frame=CGRectMake(0, 0, screenSize.size.width, 200);
    
    [self createSubviews];
    
//    self.frame=oldFrame;
    
    CGRect parentFrame=self.superview.bounds;
    
//    CGFloat height=self.maximumHeight;
    CGFloat height=screenSize.size.height;
    CGFloat width =parentFrame.size.width* spanWidthWeight;
    CGFloat margin=(parentFrame.size.width-width)/2.0f;
    
    
    if (self.orientation==kADViewOrientationBottom) {
        self.frame=CGRectMake(margin, parentFrame.origin.y+parentFrame.size.height-height+10, oldFrame.size.width, oldFrame.size.height);
        
        CGRect outerFrame=self.superview.frame;
        outerFrame.size.height+=10;
        
        UIView* temp=[[[UIView alloc] initWithFrame:outerFrame] autorelease];
        
        if (self.presentationAnimation==kADViewPresentationSlide) {
            [self animationSlideInWithDirection:kTXSAnimationBottom boundaryView:temp duration:0.3];
        }
        else if (self.presentationAnimation==kADViewPresentationFade)
        {
            [self animationFadeInWithDuration:0.3];
        }
        else if (self.presentationAnimation==kADViewPresentationSwirl)
        {
            [self animationSwirlInWithDuration:0.7];
        }
        else if (self.presentationAnimation==kADViewPresentationDrop)
        {
            [self animationDropInWithDuration:0.3];
        }
        else if(self.presentationAnimation==kADViewPresentationBounce)
        {
            [self animationBounceInWithDirection:kTXSAnimationBottom boundaryView:temp duration:0.3];
        }
    }
    else if(self.orientation==kADViewOrientationTop)
    {
        self.frame=CGRectMake(margin, 0, oldFrame.size.width, oldFrame.size.height);
        
        CGRect outerFrame=self.superview.frame;
        outerFrame.size.height-=10;
        
        UIView* temp=[[[UIView alloc] initWithFrame:outerFrame] autorelease];
        
        if (self.presentationAnimation==kADViewPresentationSlide) {
            [self animationSlideInWithDirection:kTXSAnimationTop boundaryView:temp duration:0.3];
        }
        else if (self.presentationAnimation==kADViewPresentationFade)
        {
            [self animationFadeInWithDuration:0.3];
        }
        else if (self.presentationAnimation==kADViewPresentationDrop)
        {
            [self animationDropInWithDuration:0.3];
        }
        else if (self.presentationAnimation==kADViewPresentationSwirl)
        {
            [self animationSwirlInWithDuration:0.7];
        }
        else if (self.presentationAnimation==kADViewPresentationBounce)
        {
            [self animationBounceInWithDirection:kTXSAnimationTop boundaryView:temp duration:0.3];
        }
    }
    else
    {
        self.frame=CGRectMake(margin, (parentFrame.size.height- oldFrame.size.height)/2.0f, oldFrame.size.width, oldFrame.size.height);
        
        CGRect outerFrame=self.superview.frame;
        outerFrame.size.height-=10;
        
        UIView* temp=[[[UIView alloc] initWithFrame:outerFrame] autorelease];
        
        if (self.presentationAnimation==kADViewPresentationSlide) {
            [self animationSlideInWithDirection:kTXSAnimationTop boundaryView:temp duration:0.3];
        }
        else if (self.presentationAnimation==kADViewPresentationFade)
        {
            [self animationFadeInWithDuration:0.3];
        }
        else if (self.presentationAnimation==kADViewPresentationDrop)
        {
            [self animationDropInWithDuration:0.3];
        }
        else if (self.presentationAnimation==kADViewPresentationSwirl)
        {
            [self animationSwirlInWithDuration:0.7];
        }
        else if (self.presentationAnimation==kADViewPresentationBounce)
        {
            [self animationBounceInWithDirection:kTXSAnimationTop boundaryView:temp duration:0.3];
        }
    }
    [self createPages];
    [self showPage:0];
}

-(void)show:(NSTimeInterval)duration
{
    self.dismissTimer=[NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
    [self show];
}

-(void)dismiss
{
    if (self.isDismssing) {
        return;
    }
    
    self.isDismssing=YES;
    
    if(self.dismissTimer)
    {
        [self.dismissTimer invalidate];
    }
    
    if (self.orientation==kADViewOrientationBottom) {
        if(self.presentationAnimation==kADViewPresentationSlide)
        {
            [self animationSlideOutWithDirection:kTXSAnimationBottom boundaryView:self.superview duration:0.3 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
        else if (self.presentationAnimation==kADViewPresentationFade)
        {
            [self animationFadeOutWithDuration:0.3 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
        else if (self.presentationAnimation==kADViewPresentationDrop)
        {
            [self animationDropOutWithDuration:0.3 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
        else if (self.presentationAnimation==kADViewPresentationSwirl)
        {
            [self animationSwirlOutWithDuration:0.7 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
        else if (self.presentationAnimation==kADViewPresentationBounce)
        {
            [self animationBounceOutWithDirection:kTXSAnimationBottom boundaryView:self.superview duration:0.3 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
    }
    else if(self.orientation==kADViewOrientationTop)
    {
        if (self.presentationAnimation==kADViewPresentationSlide) {
            [self animationSlideOutWithDirection:kTXSAnimationTop boundaryView:self.superview duration:0.3 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
        else if (self.presentationAnimation==kADViewPresentationFade)
        {
            [self animationFadeOutWithDuration:0.3 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
        else if (self.presentationAnimation==kADViewPresentationDrop)
        {
            [self animationDropOutWithDuration:0.3 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
        else if (self.presentationAnimation==kADViewPresentationSwirl)
        {
            [self animationSwirlOutWithDuration:0.7 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
        else if (self.presentationAnimation==kADViewPresentationBounce)
        {
            [self animationBounceOutWithDirection:kTXSAnimationTop boundaryView:self.superview duration:0.3 delegate:self startSelector:nil stopSelector:@selector(dismissAnimationCompleted)];
        }
    }
}

-(void) dismissAnimationCompleted
{
    if(self.delegate &&[self.delegate respondsToSelector:@selector(dismissADView:)]){
        [self.delegate dismissedADView:self];
    }
    
    [self removeFromSuperview];
}

-(void)createPages
{
    NSUInteger numberOfPages=[self.dataSource numberOfPagesInADView:self];
    
    self.pageControl.numberOfPages=numberOfPages;

    self.scrollViewPages.pagingEnabled=YES;
    
    CGFloat scrollIndicatorOffset=8.0f;
    
    self.scrollViewPages.contentSize=CGSizeMake(self.scrollViewPages.bounds.size.width*numberOfPages, scrollViewPages.bounds.size.height-scrollIndicatorOffset);
    
    for (NSUInteger page=0; page<numberOfPages; page++) {
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(imageForPage:adView:)])
        {
            UIImage*  pageContent=[self.dataSource imageForPage:page adView:self];
            
            if(pageContent)
            {
                UIImageView* imageViewPage=[[[UIImageView alloc] initWithFrame:CGRectMake(page*self.scrollViewPages.bounds.size.height+5,0,self.scrollViewPages.bounds.size.width-10,self.scrollViewPages.bounds.size.height-scrollIndicatorOffset)] autorelease];
                imageViewPage.image=pageContent;
                imageViewPage.contentMode=UIViewContentModeCenter;
                imageViewPage.backgroundColor=[UIColor clearColor];
                
                [self.scrollViewPages addSubview:imageViewPage];
                
                continue;
            }
        }
        
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(viewForPage:adView:)])
        {
            UIView* pageContent=[self.dataSource viewForPage:page adView:self];
            
            if(pageContent)
            {
                pageContent.frame=CGRectMake(page*self.scrollViewPages.bounds.size.width+5, 0, self.scrollViewPages.bounds.size.width-10, self.scrollViewPages.bounds.size.height-scrollIndicatorOffset);
                [self.scrollViewPages addSubview:pageContent];
                
                continue;
            }
        }
    }
    if(numberOfPages>1)
    {
        [self.scrollViewPages flashScrollIndicators];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page=self.scrollViewPages.contentOffset.x/self.scrollViewPages.bounds.size.width;
    
    if(page<0) page=0;
    
    NSUInteger numberOfPages=[self.dataSource numberOfPagesInADView:self];
    if (page>=numberOfPages) {
        page=numberOfPages-1;
    }
    
    self.pageControl.currentPage=page;
}

-(void)changePage:(id)sender
{
    [self showPage:self.pageControl.currentPage];
}

-(void)showPage:(NSInteger)page
{
    self.scrollViewPages.contentOffset=CGPointMake(page*self.scrollViewPages.bounds.size.width, 0);
}

-(void)setSpanWidthWeight:(CGFloat)spanWidthWeight_
{
    spanWidthWeight=spanWidthWeight_;
    if(spanWidthWeight>1.0f)
    {
        spanWidthWeight=1.0f;
    }
    if(spanWidthWeight<0.1f)
    {
        spanWidthWeight=0.1f;
    }
}

-(void)setBackgroundImage:(UIImage *)backgroundImage_
{
    self.layer.contents=(id)backgroundImage_.CGImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
