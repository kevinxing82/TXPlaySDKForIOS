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

+(UIImage*)  OriginImage:(UIImage *)image   scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;  
}

@end
