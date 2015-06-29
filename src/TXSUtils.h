//
//  TXSUtils.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/9.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef struct _tx_play_callback{
    __unsafe_unretained id owner;
    SEL selector;
} TXSCallback;

@interface TXSUtils : NSObject

+(NSString*)md5:(NSString*)sourceStr;
+(UIImage*)  OriginImage:(UIImage *)image   scaleToSize:(CGSize)size;

@end
