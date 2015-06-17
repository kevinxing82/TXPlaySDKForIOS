//
//  TXSLoader.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/10.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXSLoader.h"

@implementation TXSLoader

-(void)loadWithProgress:(NSString *)urlStr complete:(TXSCallback)_complete error:(TXSCallback)_error progress:(TXSCallback)_progress
{
    self.urlStr=urlStr;
    self.completeCallback=_complete;
    self.errorCallback=_error;
    self.progressCallback=_progress;
    [NSThread detachNewThreadSelector:@selector(downloadAction) toTarget:self  withObject:nil];
}

-(void)loadWithError:(NSString *)urlStr complete:(TXSCallback)_complete error:(TXSCallback)_error
{
    TXSCallback e;
    [self loadWithProgress:urlStr complete:_complete error:_errorCallback progress:e];
}

-(void)load:(NSString *)urlStr complete:(TXSCallback)_complete
{
    TXSCallback p;
    TXSCallback e;
    [self loadWithProgress:urlStr complete:_complete error:p progress:e];
}

-(void)downloadAction
{
    self.done=NO;
    self.data=[NSMutableData data];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:_urlStr ]];
    NSURLConnection *connection=[[NSURLConnection alloc]  initWithRequest:request delegate:self];
    if (connection!=nil) {
        while(!self.done)
        {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
    }
    request=nil;
    connection=nil;
}

-(void)httpConnectEnd
{
    NSLog(@"httpConnectEnd");
    	
    [self.completeCallback.owner performSelectorOnMainThread:self.completeCallback.selector withObject:self.data waitUntilDone:YES];
}


-(void)httpConnectEndWithError
{
    NSLog(@"httpConnectendWithError");
    if (self.errorCallback.selector!=nil){
        [self.errorCallback.owner performSelector:self.errorCallback.selector withObject:nil afterDelay:NO];
    }
}

#pragma mark NSURLConnectionDataDelegate methods
//不执行缓存
-(NSCachedURLResponse*)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    return nil;
}

//连接发生错误
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self performSelectorOnMainThread:@selector(httpConnectEndWithError) withObject:self waitUntilDone:NO];
}

//接受数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

//下载完毕
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self performSelectorOnMainThread:@selector(httpConnectEnd) withObject:nil waitUntilDone:NO];
}

@end
