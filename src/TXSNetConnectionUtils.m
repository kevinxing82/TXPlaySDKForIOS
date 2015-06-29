//
//  TXSNetConnectionUtils.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/8.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXSNetConnectionUtils.h"
#import "TXSUtils.h"
#import "TXSADInfo.h"
#import "TXSADInfoDelegate.h"

@implementation TXSNetConnectionUtils

NSString* const baseUrl=@"http://umuad.com/index.php?controller=SDK_Interface&action=getAd";
NSString* const SDKKey=@"i9L#bQ!,&0s";
NSString* const appKey	=@"d1cbd3700f73f345";

+(void)requestAdvertisementDatas:(NSString *)sdkver appID:(NSString *)_appID packageName:(NSString *)_packageName channel:(NSString *)_channel test:(NSString *)_test type:(NSString *)_type networkType:(NSString *)_networkType networkSubType:(NSString *)_networkSubType uid:(NSString *)_uid ua:(NSString *)_ua imei:(NSString *)_imei sysver:(NSString *)_sysver p:(NSString *)_p imsi:(NSString *)_imsi width:(NSString *)_width height:(NSString *)_height
{
    NSString *urlStr=[NSString stringWithFormat:@"%@&uid=%@&sdkver=%@&appid=%@&packageName=%@&test=%@&channel=%@&type=%@&networkType=%@",baseUrl,@"65",sdkver,_appID,_packageName,_test,_channel,_type,_networkType];
    NSLog(@"URLSTR:%@",urlStr);
    NSString *encryptStr=[TXSUtils md5:[NSString stringWithFormat:@"%@%@%@",SDKKey,urlStr,appKey]];
    NSLog(@"EncryptStr:%@",encryptStr);
    NSString *requestStr=[NSString stringWithFormat:@"%@&s=%@",urlStr,encryptStr];
    NSLog(@"RequestURL:%@",requestStr);
    NSMutableURLRequest *request=[NSMutableURLRequest  requestWithURL:[NSURL URLWithString:requestStr]];
    [request setTimeoutInterval:10.0];
    
    NSOperationQueue *queue=[[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError){
//        NSLog(@"--block回调数据--%@---%d", [NSThread currentThread],data.length);
        if(connectionError){
            NSLog(@"HttpError:%@%d",connectionError.localizedDescription,connectionError.code);
        }else {
//            NSInteger responseCode=[(NSHTTPURLResponse*) response statusCode];
//            NSString * responeString=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"HttpResponseCode:%d",responseCode);
//            NSLog(@"HttpResponseBody:%@",responeString);
            TXSADInfoDelegate* delegate=[[TXSADInfoDelegate alloc] init];
            [delegate parser:data];
        }
    }];
}
@end
