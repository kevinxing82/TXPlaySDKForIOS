//
//  TXSLoader.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/10.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TXSUtils.h"

@interface TXSLoader : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,copy) NSString*  urlStr;
@property(strong,nonatomic) NSMutableData *data;
@property Boolean done;

@property(nonatomic, assign) TXSCallback completeCallback;
@property(nonatomic,assign) TXSCallback progressCallback;
@property(nonatomic,assign) TXSCallback errorCallback;

-(void)downloadAction;
-(void)load:(NSString*) urlStr complete:(TXSCallback)_complete;
-(void)loadWithError:(NSString*)urlStr complete:(TXSCallback)_complete error:(TXSCallback)_error;
-(void)loadWithProgress:(NSString*) urlStr complete:(TXSCallback)_complete error:(TXSCallback)_error progress:(TXSCallback)_progress;
@end
