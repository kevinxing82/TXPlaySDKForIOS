//
//  TXSUtils.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/9.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXSUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation TXSUtils

+ (NSString *) md5:(NSString *)srouceStr	
{
    const char* str = [srouceStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    return ret;
}

@end
