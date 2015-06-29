//
//  TXPlaySDKMgr.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/2.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXPlaySDKManager.h"
#import "TXSADViewEx.h"
#import "TXSNetConnectionUtils.h"
#import <MediaPlayer/MediaPlayer.h>
#import "TXSLoader.h"

@implementation TXPlaySDKManager

@synthesize view;

+(TXPlaySDKManager*)sharedInstance
{
    static  TXPlaySDKManager* s_sharedInstance=nil;
    
    @synchronized(self)
    {
        if(!s_sharedInstance)
        {
            s_sharedInstance=[[TXPlaySDKManager alloc]   init];
            s_sharedInstance.view=nil;
        }
    }
    
    return s_sharedInstance;
}

-(void) initWithNetwork
{
    [TXSNetConnectionUtils requestAdvertisementDatas:@"1.0" appID:@"b83aacefa81c4c69" packageName:@"cn.txplay" channel:@"c1,c2,c3,c4,c5,c6" test:@"1" type:@"1" networkType:@"1" networkSubType:(NSString *)nil uid:(NSString *)nil ua:(NSString *)nil imei:(NSString *)nil sysver:(NSString *)nil p:(NSString *)nil imsi:(NSString *)nil width:(NSString *)nil height:(NSString *)nil];
}

-(BOOL)isInitialized
{
    if (self.view==nil) {
        return NO;
    }
    else {
        return YES;
    }
    
}

-(CGRect)getAppRect
{
    return [UIScreen mainScreen].applicationFrame;
}

-(CGRect)getScreenRect
{
    return [UIScreen mainScreen].bounds;
}

-(void) showBarAd
{
    TXSCallback c;
    c.selector=@selector(_showBarAD:);
    c.owner=self;
    TXSLoader* loader=[[TXSLoader alloc] init];
    [loader load:barURL complete:c];
}

-(void)_showBarAD:(NSData*) data
{
    UIImage *image=[UIImage imageWithData:data];
    __block TXSADViewEx*  delegate=[TXSADViewEx infoADView];
    
    delegate.adID=kADID_Home;
    [delegate addPageWithImage:image];
    [delegate showInView:self->view orientation:kADViewOrientationTop];
}

-(void)showFullScreenAd
{
    TXSCallback c;
    c.selector=@selector(_showFullScreenAd:);
    c.owner=self;
    TXSLoader* loader=[[TXSLoader alloc] init];
    [loader load:fullScreenURL complete:c];
}

-(void)_showFullScreenAd:(NSData*) data
{
    UIImage *image=[UIImage imageWithData:data];
    __block TXSADViewEx*  delegate=[TXSADViewEx infoADView];
    
    delegate.adID=kADID_Home;
    [delegate addPageWithImage:image];	
    [delegate showInView:self->view orientation:kADViewOrientationCenter];
}

-(void)showVideoAd
{
    if(videoURL.length>0)
    {
        MPMoviePlayerController* player=[[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:videoURL]];
        
        CGRect screenRect=[UIScreen mainScreen].bounds;
        CGRect movieRect=CGRectMake(0, 0, 240, 160);
        __block TXSADViewEx*  delegate=[TXSADViewEx videoADView];
        delegate.adID=kADID_Home;
        [delegate addPageWithView:player.view];
        [delegate showInView:self->view
                 orientation:kADViewOrientationCenter];
        [delegate.adView setFrame:CGRectMake((screenRect.size.width-movieRect.size.width)/2, (screenRect.size.height-movieRect.size.height)/2, movieRect.size.width, movieRect.size.height)];
        [delegate.adView autoLayout];
    	[delegate setDismissedHandler:^{
            [TXSADViewEx setHasDismissedAD:delegate.adID];
            [player stop];
        }];
        [player prepareToPlay];
        [player.view setFrame:CGRectMake(0, 0, movieRect.size.width, movieRect.size.height)];
        [player play];
    }
    
}

-(void)showWallAd
{
    if(innerWebURL.length>0)
    {
        NSLog(@"%@",innerWebURL);
        NSURL *url=[NSURL URLWithString:innerWebURL];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        UIWebView *webView=[[UIWebView alloc] initWithFrame:[TXPlaySDKMgr getAppRect]];
        [webView loadRequest:request];
        
        __block TXSADViewEx*  delegate=[TXSADViewEx webADView];
        delegate.adID=kADID_Home;
        [delegate addPageWithView:webView];
        [delegate showInView:self->view orientation:kADViewOrientationTop];
    }
}

-(void)showStartupAd
{

}

-(TXSADSplashView*)showSpalshScreen:(CGRect)frameSize
{
    TXSADSplashView* splashView=[[TXSADSplashView alloc]initWithFrame:frameSize];
    [splashView launch];
    return splashView;
}

-(void)setData:(TXSADInfo *)info
{
    if ([info.model isEqual:@"1"]) {
        barURL=info.src;
        nextBarURL=info.next_src;
    }
    
    if ([info.model isEqual:@"2"]) {
        fullScreenURL=info.src;
        nextFullScreenURL=info.next_src;
    }
    
    if([info.model isEqual:@"3"]){
        videoURL=info.src;
        nextVideoURL=info.next_src;
    }
    
    if([info.model isEqual:@"4"]){
        innerWebURL=info.url;
        nextInnerWebURL=info.url;
    }
    
    if([info.model isEqual:@"6"]){
        startupURL=info.src;
        nextStartupURL=info.next_src;
    }
}
@end
